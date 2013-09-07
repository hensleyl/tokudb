#
# Cookbook Name:: tokudb
# Recipe:: default
#
# Copyright 2013, Leslie Hensley
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

group node['tokudb']['group']
user node['tokudb']['user'] do
  gid node['tokudb']['group']
  system true
end

directory node['tokudb']['install_dir'] do
  owner node['tokudb']['user']
  group node['tokudb']['group']
  recursive true
end

include_recipe 'tar'
tar_extract node['tokudb']['url'] do
  target_dir node['tokudb']['install_dir']
  creates "#{node['tokudb']['install_dir']}/README-TOKUDB"
  group node['tokudb']['group']
  user node['tokudb']['user']
  tar_flags ['--strip-components=1']
end

template "/etc/my.cnf" do
  source "my.cnf.erb"
end

directory "#{node['tokudb']['data_dir']}/binlog" do
  owner node['tokudb']['user']
  group node['tokudb']['group']
  recursive true
end

execute "mysql_install_db" do
  command "#{node['tokudb']['install_dir']}/scripts/mysql_install_db --basedir=#{node['tokudb']['install_dir']} --user=#{node['tokudb']['user']}"
  creates "#{node['tokudb']['data_dir']}/mysql"
end

template "/etc/profile.d/tokudb.sh" do
  source "tokudb.sh.erb"
end

template "/etc/ld.so.conf.d/tokudb.conf" do
  source "tokudb.conf.erb"
end

execute "ldconfig" do
  command "/sbin/ldconfig"
end

cookbook_file "/etc/init.d/mysql" do
  mode 0755
end

service "mysql" do
  action [ :enable, :start ]
end

execute "assign-root-password" do
  command "\"#{node['tokudb']['install_dir']}/bin/mysqladmin\" -u root password \"#{node['tokudb']['server_root_password']}\""
  action :run
  only_if "\"#{node['tokudb']['install_dir']}/bin/mysql\" -u root -e 'show databases;'"
end

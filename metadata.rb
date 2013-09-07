name             'tokudb'
maintainer       'Leslie Hensley'
maintainer_email 'hensleyl@papermountain.org'
license          'Apache 2.0'
description      'Installs/Configures tokudb'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

%w{redhat centos}.each do |os|
  supports os
end

%w{tar}.each do |cb|
  depends cb
end
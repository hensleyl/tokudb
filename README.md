Tokudb Cookbook
===============
Installs the [Tokudb database server](http://www.tokutek.com/products/tokudb-for-mysql/)

Requirements
------------
- supports Centos and RHEL
- the tar cookbook

Attributes
----------
#### tokudb::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['tokudb']['url']</tt></td>
    <td>String</td>
    <td>URL to download the binary release from</td>
    <td><tt>http://www.tokutek.com/download.php?download_file=mysql-5.5.30-tokudb-7.0.4-linux-x86_64.tar.gz</tt></td>
  </tr>
  <tr>
    <td><tt>['tokudb']['install_dir']</tt></td>
    <td>String</td>
    <td>directory to install to</td>
    <td><tt>/opt/tokutek/mysql</tt></td>
  </tr>
  <tr>
    <td><tt>['tokudb']['data_dir']</tt></td>
    <td>String</td>
    <td>directory that the database files will be stored in</td>
    <td><tt>/var/lib/mysql</tt></td>
  </tr>
  <tr>
    <td><tt>['tokudb']['bin_log_path']</tt></td>
    <td>String</td>
    <td>base name for the binary logs. Set to the empty string to disable binary logging</td>
    <td><tt>/var/lib/mysql/binlog/mysql-bin</tt></td>
  </tr>
  <tr>
    <td><tt>['tokudb']['user']</tt></td>
    <td>String</td>
    <td>user that will own the installation.  User is created if it does not already exist.</td>
    <td><tt>mysql</tt></td>
  </tr>
  <tr>
    <td><tt>['tokudb']['group']</tt></td>
    <td>String</td>
    <td>group that will own the installation.  Group is created if it does not already exist.</td>
    <td><tt>mysql</tt></td>
  </tr>
  <tr>
    <td><tt>['tokudb']['server_root_password']</tt></td>
    <td>String</td>
    <td>password for the root database user</td>
    <td>no default. Must be set</td>
  </tr>
</table>

Usage
-----
#### tokudb::default

e.g.
Just include `tokudb` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[tokudb]"
  ]
}
```

Contributing
------------
1.  Fork the repository on Github
2.  Create a named feature branch (like `add_component_x`)
3.  Write your change
6.  Submit a Pull Request using Github

License and Authors
-------------------
Author:: Leslie A Hensley (<hensley@papermountain.org>)

Copyright 2013, Leslie A Hensley

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

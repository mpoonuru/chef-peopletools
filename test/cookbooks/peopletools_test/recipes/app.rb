#
# Cookbook Name:: peopletools_test
# Recipe:: app
#
# Copyright 2016 University of Derby
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# users/groups and system settings
include_recipe "#{cookbook_name}::system"

# oracle_client
peopletools_oracle_client '12.1.0.2' do
  archive_url "#{node['peopletools']['archive_repo']}/pt-oracleclient-12.1.0.2.tgz"
end

# tnsnames
peopletools_tnsnames '12.1.0.2' do
  db_host 'localhost'
  db_name 'KITCHEN'
end

# ps_home
peopletools_ps_home '8.55.05' do
  archive_url "#{node['peopletools']['archive_repo']}/pt-pshome8.55.05.tgz"
end

# tuxedo
peopletools_tuxedo '12.1.3.0.0' do
  archive_url "#{node['peopletools']['archive_repo']}/pt-tuxedo12.1.3.0.0.tgz"
  tlisten_password 'password'
end

# .bashrc
peopletools_bashrc 'psadm2' do
  oracle_client_version '12.1.0.2'
  ps_home_version '8.55.05'
  tuxedo_version '12.1.3.0.0'
end

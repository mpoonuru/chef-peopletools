#
# Cookbook Name:: peopletools_test
# Recipe:: web
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

# users, groups, and system settings
include_recipe "#{cookbook_name}::fix_hostname"
include_recipe "#{cookbook_name}::_common"

# ps_home
peopletools_ps_home '8.56.10' do
  archive_url "#{node['peopletools']['archive_repo']}/pt-pshome8.56.10.tgz"
end

# jdk
peopletools_jdk '1.8.0_181' do
  archive_url "#{node['peopletools']['archive_repo']}/jdk-8u181-linux-x64.tar.gz"
end

# weblogic
peopletools_weblogic '12.2.1.3.0' do
  archive_url "#{node['peopletools']['archive_repo']}/pt-weblogic12.2.1.3.0.tgz"
  jdk_version '1.8.0_181'
end

# .bashrc
peopletools_bashrc 'psadm2' do
  oracle_client_version '12.1.0.2'
  ps_home_version '8.56.10'
  tuxedo_version '12.2.2.0.0'
end

# webserver domain
peopletools_webserver_domain 'KIT' do
  admin_password 'admin_password'
  appserver_connection_password 'appserver_connection_password'
  appserver_name 'localhost'
  igw_password 'igw_password'
  ps_home '/opt/oracle/psft/pt/ps_home8.56.10'
  ps_cfg_home '/home/psadm2'
  sensitive true
  web_profile_password 'web_profile_password'
end

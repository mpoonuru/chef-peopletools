#
# Cookbook Name:: peopletools_test
# Recipe:: prcs
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
include_recipe "#{cookbook_name}::_common"

# oracle_client
peopletools_oracle_client '12.1.0.2' do
  archive_url "#{node['peopletools']['archive_repo']}/pt-oracleclient-12.1.0.2.tgz"
end

# tnsnames
peopletools_tnsnames '12.1.0.2' do
  db_host node['peopletools']['db_host']
  db_name node['peopletools']['db_name']
end

# ps_home
peopletools_ps_home '8.55.05' do
  archive_url "#{node['peopletools']['archive_repo']}/pt-pshome8.55.05.tgz"
end

# tuxedo
peopletools_tuxedo '12.1.3.0.0' do
  archive_url "#{node['peopletools']['archive_repo']}/pt-tuxedo12.1.3.0.0.tgz"
  tlisten_password 'password'
  sensitive true
end

# .bashrc
peopletools_bashrc 'psadm2' do
  oracle_client_version '12.1.0.2'
  ps_home_version '8.55.05'
  tuxedo_version '12.1.3.0.0'
end

peopletools_prcs_domain 'KIT' do
  config_settings(
    '[Process Scheduler]' => ['Allow Dynamic Changes=Y'],
    '[SMTP Settings]' => ['SMTPServer=localhost']
  )
  feature_settings [
    '{APPENG}=Yes', # App Engine
    '{MSTRSRV}=Yes', # Master Scheduler
    '{PPM}=No', # Perf Collator
    '{DOMAIN_GW}=No', # Domains Gateway
    '{SERVER_EVENTS}=No' # Push Notifications
  ]
  ps_home '/opt/oracle/psft/pt/ps_home8.55.05'
  ps_cfg_home '/home/psadm2'
  startup_settings [
    node['peopletools']['db_name'], # Database name
    'ORACLE', # Database type
    'PSUNX', # Prcs server
    'opr_user_id', # OPR user ID
    'opr_user_pwd', # OPR user password
    'connect_id', # Connect ID
    'connect_pwd', # Connect password
    '_____', # Server name
    '%PS_SERVDIR%/log_output', # Log/output directory
    '%PS_HOME%/bin/sqr/%PS_DB%/bin', # SQRBIN
    '_____', # Add to path
    'domain_connection_pwd', # Domain connection password
    'ENCRYPT' # (NO)ENCRYPT passwords
  ]
  sensitive true
end

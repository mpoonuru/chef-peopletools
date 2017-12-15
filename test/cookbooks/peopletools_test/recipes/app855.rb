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

# users, groups, and system settings
include_recipe "#{cookbook_name}::fix_hostname"
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
peopletools_ps_home '8.55.17' do
  archive_url "#{node['peopletools']['archive_repo']}/pt-pshome8.55.17.tgz"
end

# tuxedo
peopletools_tuxedo '12.1.3.0.0' do
  archive_url "#{node['peopletools']['archive_repo']}/pt-tuxedo12.1.3.0.0.tgz"
  tlisten_password 'tlisten_password'
  sensitive true
end

# .bashrc
peopletools_bashrc 'psadm2' do
  oracle_client_version '12.1.0.2'
  ps_home_version '8.55.17'
  tuxedo_version '12.1.3.0.0'
end

peopletools_appserver_domain 'KIT' do # rubocop:disable Metrics/BlockLength
  config_settings(
    '[Domain Settings]' => ['Allow Dynamic Changes=Y', 'Domain ID=KIT'],
    '[SMTP Settings]' => ['SMTPServer=localhost']
  )
  feature_settings [
    '{PUBSUB}=No', # Pub/Sub Servers
    '{QUICKSRV}=No', # Quick Server
    '{QUERYSRV}=Yes', # Query Servers
    '{JOLT}=Yes', # Jolt
    '{JRAD}=No', # Jolt Relay
    '{WSL}=Yes', # WSL
    '{DBGSRV}=No', # PC Debugger
    '{RENSRV}=No', # Event Notification
    '{MCF}=No', # MCF Servers
    '{PPM}=No', # Perf Collator
    '{ANALYTICSRV}=No', # Analytic Servers
    '{DOMAIN_GW}=No', # Domains Gateway
    '{SERVER_EVENTS}=No' # Push Notifications
  ]
  ps_home '/opt/oracle/psft/pt/ps_home8.55.17'
  ps_cfg_home '/home/psadm2'
  startup_settings [
    node['peopletools']['db_name'], # Database name
    'ORACLE', # Database type
    'opr_user_id', # OPR user ID
    'opr_user_password', # OPR user password
    'KIT', # Domain ID
    '_____', # Add to path
    'connect_id', # Connect ID
    'connect_password', # Connect password
    '_____', # Server name
    'domain_connection_password', # Domain connection password
    'ENCRYPT' # (NO)ENCRYPT passwords
  ]
  sensitive true
end # rubocop:enable Metrics/BlockLength

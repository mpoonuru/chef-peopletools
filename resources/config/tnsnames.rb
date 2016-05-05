#
# Cookbook Name:: peopletools
# Resource:: tnsnames
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

resource_name :peopletools_tnsnames
default_action :create
property :db_host, String, default: node['peopletools']['db_host']
property :db_name, String, default: node['peopletools']['db_name']
property :db_port, String, default: node['peopletools']['db_port']
property :db_protocol, String, default: node['peopletools']['tnsnames']['db_protocol']
property :db_service_name, String, default: node['peopletools']['db_name']
property :dir, String, default: ::File.join(
  node['peopletools']['psft']['path'], node['peopletools']['pt']['dir'], node['peopletools']['oracle_client']['dir'], node['peopletools']['oracle_client']['version'], 'network', 'admin'
)
property :file_name, String, default: node['peopletools']['tnsnames']['file_name']
property :group, String, default: node['peopletools']['group']['oracle_install']['name']
property :mode, String, default: node['peopletools']['tnsnames']['mode']
property :owner, String, default: node['peopletools']['user']['oracle']['name']
property :server, equal_to: %w(DEDICATED SHARED), default: node['peopletools']['tnsnames']['server']

action :create do
  # tnsnames.ora file
  template ::File.join(dir, file_name) do
    source 'config/tnsnames/tnsnames.ora.erb'
    cookbook 'peopletools'
    mode new_resource.mode
    owner new_resource.owner
    group new_resource.group
    variables(
      db_host: db_host,
      db_name: db_name,
      db_port: db_port,
      db_protocol: db_protocol,
      db_service_name: db_service_name,
      server: server
    )
    action :create
  end
end

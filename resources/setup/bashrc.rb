#
# Cookbook Name:: peopletools
# Resource:: bashrc
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

resource_name :peopletools_bashrc
default_action :create
property :cobol_dir, String, default: node['peopletools']['cobol_dir']
property :custom_commands, Array, default: node['peopletools']['bashrc']['custom_commands']
property :db2_instance_user, String
property :group, String, default: node['peopletools']['group']['oracle_install']['name']
property :mode, String, default: '0644'
property :oracle_home_dir, String, default: ::File.join(
  node['peopletools']['psft']['path'], node['peopletools']['pt']['dir'], node['peopletools']['oracle_client']['dir'], node['peopletools']['oracle_client']['version']
)
property :owner, String, default: node['peopletools']['user']['psft_runtime']['name']
property :path, String, name_property: true
property :ps_app_home_dir, String, default: ::File.join(node['peopletools']['psft']['path'], node['peopletools']['pt']['dir'], node['peopletools']['ps_app_home']['dir'])
property :ps_cfg_home_dir, String, default: lazy { path }
property :ps_cust_home_dir, String, default: lazy { ::File.join(path, 'custom') }
property :ps_home_dir, String, default: ::File.join(
  node['peopletools']['psft']['path'], node['peopletools']['pt']['dir'], "#{node['peopletools']['ps_home']['dir']}#{node['peopletools']['ps_home']['version']}"
)
property :tns_admin_dir, String
property :tuxedo_dir, String, default: ::File.join(node['peopletools']['psft']['path'], node['peopletools']['pt']['dir'], node['peopletools']['tuxedo']['dir'], "tuxedo#{node['peopletools']['tuxedo']['version']}")

action :create do
  # tnsnames.ora file
  template ::File.join(path, '.bashrc') do
    source 'setup/bashrc/.bashrc.erb'
    cookbook 'peopletools'
    mode new_resource.mode
    owner new_resource.owner
    group new_resource.group
    variables(
      cobol_dir: cobol_dir,
      custom_commands: custom_commands,
      db2_instance_user: db2_instance_user,
      oracle_home_dir: oracle_home_dir,
      ps_app_home_dir: ps_app_home_dir,
      ps_cfg_home_dir: ps_cfg_home_dir,
      ps_cust_home_dir: ps_cust_home_dir,
      ps_home_dir: ps_home_dir,
      tns_admin_dir: tns_admin_dir,
      tuxedo_dir: tuxedo_dir
    )
    action :create
  end
end

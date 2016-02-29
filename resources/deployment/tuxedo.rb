#
# Cookbook Name:: peopletools
# Resource:: tuxedo
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

resource_name :peopletools_tuxedo
default_action :deploy
property :archive_file, String, default: ::File.join(node['peopletools']['archive_repo'], node['peopletools']['tuxedo']['archive_file'])
property :deploy_location, String, default: ::File.join(node['peopletools']['psft']['path'], node['peopletools']['pt']['dir'], node['peopletools']['tuxedo']['dir'])
property :deploy_user, String, default: node['peopletools']['user']['psft_install']['name']
property :deploy_group, String, default: node['peopletools']['group']['oracle_install']['name']
property :home_name, String, default: node['peopletools']['tuxedo']['home_name']
property :inventory_location, String, default: ::File.join(node['peopletools']['psft']['path'], node['peopletools']['db']['dir'], node['peopletools']['inventory']['dir'])
property :inventory_user, String, default: node['peopletools']['user']['oracle']['name']
property :inventory_group, String, default: node['peopletools']['group']['oracle_install']['name']
property :tlisten_password, String, default: node['peopletools']['tuxedo']['tlisten_password']
property :version, String, default: node['peopletools']['tuxedo']['version']

action :deploy do
  # inventory
  peopletools_inventory inventory_location do
    inventory_location new_resource.inventory_location
    inventory_user new_resource.inventory_user
    inventory_group new_resource.inventory_group
  end

  # extract tuxedo archive
  ark ::File.basename(deploy_location) do
    path ::File.dirname(deploy_location)
    url archive_file
    owner deploy_user
    group deploy_group
    strip_components 0
    not_if { ::File.exist?(deploy_location) }
    notifies :run, "ruby_block[chmod_R_#{deploy_location}]", :immediately
    notifies :run, 'execute[tuxedo_runInstaller]', :immediately
    action :put
  end

  # tuxedo directory permissions
  ruby_block "chmod_R_#{deploy_location}" do
    block do
      FileUtils.chmod_R(0755, deploy_location)
    end
    only_if { ::File.directory?(deploy_location) }
    action :nothing
  end

  # execute tuxedo runInstaller
  execute 'tuxedo_runInstaller' do
    command "su - #{deploy_user} -c \"#{::File.join(deploy_location, 'oui', 'bin', 'runInstaller')} " \
            "-silent -clone -waitforcompletion -nowait -invPtrLoc #{inventory_location}/oraInst.loc " \
            "ORACLE_HOME=#{deploy_location} ORACLE_HOME_NAME=#{home_name} TLISTEN_PASSWORD=#{tlisten_password}\""
    only_if { ::File.file?(::File.join(deploy_location, 'oui', 'bin', 'runInstaller')) }
    action :nothing
  end
end

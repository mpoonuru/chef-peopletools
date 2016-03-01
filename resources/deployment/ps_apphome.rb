#
# Cookbook Name:: peopletools
# Resource:: ps_apphome
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

resource_name :peopletools_ps_apphome
default_action :deploy
property :archive_url, String, default: ::File.join(node['peopletools']['archive_repo'], node['peopletools']['ps_apphome']['archive_file'])
property :db_platform, equal_to: %w(ORACLE DB2ODBC DB2UNIX), default: node['peopletools']['db_platform']
property :deploy_location, String, default: ::File.join(node['peopletools']['psft']['path'], node['peopletools']['pt']['dir'], node['peopletools']['ps_apphome']['dir'])
property :deploy_user, String, default: node['peopletools']['user']['psft_install']['name']
property :deploy_group, String, default: node['peopletools']['group']['oracle_install']['name']
property :extract_only, [TrueClass, FalseClass], default: node['peopletools']['ps_apphome']['extract_only']
property :version, String, default: node['peopletools']['ps_apphome']['version']

action :deploy do
  # extract ps_apphome archive
  ark ::File.basename(deploy_location) do
    path ::File.dirname(deploy_location)
    url archive_url
    owner deploy_user
    group deploy_group
    strip_components 0
    not_if { ::File.exist?(deploy_location) }
    notifies :run, "ruby_block[chmod_R_#{deploy_location}]", :immediately
    notifies :run, "ruby_block[db_type_#{deploy_location}]", :immediately
    action :put
  end

  # ps_apphome directory permissions
  ruby_block "chmod_R_#{deploy_location}" do
    block do
      FileUtils.chmod_R(0755, deploy_location)
    end
    only_if { ::File.directory?(deploy_location) }
    action :nothing
  end

  # ps_apphome db_type
  ruby_block "db_type_#{deploy_location}" do
    block do
      # set db_type
      case db_platform
      when 'ORACLE'
        db_type = 'ORA'
      when 'DB2ODBC'
        db_type = 'DB2'
      when 'DB2UNIX'
        db_type = 'DBX'
      else
        db_type = nil
        raise 'Invalid db_platform'
      end

      # move db_type files and folders
      FileUtils.mv(::File.join(deploy_location, db_type, 'scripts'), deploy_location)
      FileUtils.mv(Dir.glob(::File.join(deploy_location, db_type, 'setup', 'dbcodes.*'))[0], ::File.join(deploy_location, 'setup'))

      # remove database directories
      %w(ORA DB2 DBX).each do |d|
        FileUtils.remove_dir(::File.join(deploy_location, d), true)
      end
    end
    not_if { extract_only || !::File.directory?(deploy_location) }
    action :nothing
  end
end

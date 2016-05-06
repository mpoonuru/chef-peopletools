#
# Cookbook Name:: peopletools
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
include_recipe 'peopletools::system'

# oracle_client
peopletools_oracle_client node['peopletools']['oracle_client']['version']

# tnsnames
peopletools_tnsnames ::File.join(
  node['peopletools']['psft']['path'], node['peopletools']['pt']['dir'], node['peopletools']['oracle_client']['dir'], node['peopletools']['oracle_client']['version'], 'network', 'admin', 'tnsnames.ora'
)

# ps_home
peopletools_ps_home node['peopletools']['ps_home']['version']

# tuxedo
peopletools_tuxedo node['peopletools']['tuxedo']['version']

# .bashrc
peopletools_bashrc ::File.join(node['peopletools']['user']['home_dir'], node['peopletools']['user']['psft_runtime']['name'])

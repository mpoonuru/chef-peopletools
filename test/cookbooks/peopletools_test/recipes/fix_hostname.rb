#
# Cookbook Name:: derby_ps_campus_test
# Recipe:: fix_hostname
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

# set hostname to short hostname for tuxedo
execute "hostnamectl set-hostname #{node['hostname'].gsub(/\..*vagrantup.com/, '')}" do
  only_if { platform_family?('rhel') && node['platform_version'].to_f >= 7 }
  only_if 'hostnamectl status --static | grep -e \..*vagrantup\.com'
end

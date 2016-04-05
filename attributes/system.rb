#
# Cookbook Name:: peopletools
# Attributes:: system
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

# groups
default['peopletools']['group']['psft_runtime']['name'] = 'psft'
default['peopletools']['group']['psft_app_install']['name'] = 'appinst'
default['peopletools']['group']['oracle_install']['name'] = 'oinstall'
default['peopletools']['group']['oracle_runtime']['name'] = 'dba'

# user defaults
default['peopletools']['user']['home_dir'] = '/home'
default['peopletools']['user']['shell'] = '/bin/bash'

# psft_install user
default['peopletools']['user']['psft_install']['name'] = 'psadm1'
default['peopletools']['user']['psft_install']['password'] = '0radmin'

# psft_runtime user
default['peopletools']['user']['psft_runtime']['name'] = 'psadm2'
default['peopletools']['user']['psft_runtime']['password'] = '0radmin'

# psft_app_install user
default['peopletools']['user']['psft_app_install']['name'] = 'psadm3'
default['peopletools']['user']['psft_app_install']['password'] = '0radmin'

# oracle user
default['peopletools']['user']['oracle']['name'] = 'oracle2'
default['peopletools']['user']['oracle']['password'] = 'oracle'

# limits
default['peopletools']['limits']['group']['hard']['nofile'] = 65_536
default['peopletools']['limits']['group']['soft']['nofile'] = 65_536
default['peopletools']['limits']['group']['hard']['nproc'] = 65_536
default['peopletools']['limits']['group']['soft']['nproc'] = 65_536
default['peopletools']['limits']['group']['hard']['core'] = 'unlimited'
default['peopletools']['limits']['group']['soft']['core'] = 'unlimited'
default['peopletools']['limits']['group']['hard']['memlock'] = 500_000
default['peopletools']['limits']['group']['soft']['memlock'] = 500_000
default['peopletools']['limits']['group']['hard']['stack'] = 102_400
default['peopletools']['limits']['group']['soft']['stack'] = 102_400
default['peopletools']['limits']['user']['hard']['nofile'] = 131_072
default['peopletools']['limits']['user']['soft']['nofile'] = 131_072
default['peopletools']['limits']['user']['hard']['nproc'] = 131_072
default['peopletools']['limits']['user']['soft']['nproc'] = 131_072
default['peopletools']['limits']['user']['hard']['core'] = 'unlimited'
default['peopletools']['limits']['user']['soft']['core'] = 'unlimited'
default['peopletools']['limits']['user']['hard']['memlock'] = 500_000
default['peopletools']['limits']['user']['soft']['memlock'] = 500_000

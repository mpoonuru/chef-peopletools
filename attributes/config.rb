#
# Cookbook Name:: peopletools
# Attributes:: config
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

# database
default['peopletools']['db_host'] = '' # database host. Set this at environment, role, node, or cookbook level
default['peopletools']['db_name'] = '' # database name. Set this at environment, role, node, or cookbook level
default['peopletools']['db_port'] = '1521' # database port. Set this at environment, role, node, or cookbook level

# tnsnames
default['peopletools']['tnsnames']['db_protocol'] = 'TCP' # tnsnames database protocol
default['peopletools']['tnsnames']['file_name'] = 'tnsnames.ora' # tnsnames file name
default['peopletools']['tnsnames']['mode'] = '0644' # tnsnames file mode
default['peopletools']['tnsnames']['server'] = 'DEDICATED' # tnsnames server type

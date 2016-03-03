#
# Cookbook Name:: peopletools
# Attributes:: deployment
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

# common
default['peopletools']['archive_repo'] = '' # repo containing the archive files delivered in the Oracle DPK. Set this at environment, role, node, or cookbook level
default['peopletools']['db_platform'] = 'ORACLE' # database platform equal_to: %w(ORACLE DB2ODBC DB2UNIX)
default['peopletools']['psft']['path'] = '/opt/oracle/psft' # peoplesoft base path
default['peopletools']['db']['dir'] = 'db' # peoplesoft db base directory
default['peopletools']['pt']['dir'] = 'pt' # peoplesoft pt base directory

# inventory
default['peopletools']['inventory']['dir'] = 'oraInventory' # inventory directory
default['peopletools']['inventory']['minimum_ver'] = '2.1.0.6.0' # inventory minimum version
default['peopletools']['inventory']['saved_with'] = '13.2.0.0.0' # inventory saved with version

# jdk
default['peopletools']['jdk']['archive_file'] = 'pt-jdk1.7.0_91.tgz' # jdk archive file
default['peopletools']['jdk']['dir'] = 'jdk' # jdk directory prefix
default['peopletools']['jdk']['version'] = '1.7.0_91' # jdk version

# oracle_client
default['peopletools']['oracle_client']['archive_file'] = 'pt-oracleclient-12.1.0.2.tgz' # oracle_client archive file
default['peopletools']['oracle_client']['dir'] = 'oracle-client' # oracle_client directory
default['peopletools']['oracle_client']['home_name'] = 'OraClient12cHome' # oracle_client inventory home name
default['peopletools']['oracle_client']['tmp_dir'] = 'oc_tmp' # oracle_client tmp directory
default['peopletools']['oracle_client']['version'] = '12.1.0.2' # oracle_client version

# ps_apphome
default['peopletools']['ps_apphome']['archive_file'] = '' # ps_apphome archive file
default['peopletools']['ps_apphome']['archive_repo'] = '' # ps_apphome archive repo (in case this is different from the peopletools archive repo)
default['peopletools']['ps_apphome']['dir'] = 'ps_app_home' # ps_apphome directory
default['peopletools']['ps_apphome']['extract_only'] = false # ps_apphome extract archive only
default['peopletools']['ps_apphome']['version'] = '' # ps_apphome version

# ps_home
default['peopletools']['ps_home']['archive_file'] = 'pt-pshome8.55.01.tgz' # ps_home archive file
default['peopletools']['ps_home']['dir'] = 'ps_home' # ps_home directory
default['peopletools']['ps_home']['extract_only'] = false # ps_home extract archive only
default['peopletools']['ps_home']['unicode_db'] = true # ps_home unicode database
default['peopletools']['ps_home']['version'] = '8.55.01' # ps_home version

# tuxedo
default['peopletools']['tuxedo']['archive_file'] = 'pt-tuxedo12.1.3.0.0.tgz' # tuxedo archive file
default['peopletools']['tuxedo']['dir'] = 'bea/tuxedo' # tuxedo directory
default['peopletools']['tuxedo']['home_name'] = 'OraTux1213Home' # tuxedo inventory home name
default['peopletools']['tuxedo']['tlisten_password'] = 'password' # tuxedo listener password
default['peopletools']['tuxedo']['version'] = '12.1.3.0.0' # tuxedo version

# weblogic
default['peopletools']['weblogic']['archive_file'] = 'pt-weblogic12.1.3.tgz' # weblogic archive file
default['peopletools']['weblogic']['dir'] = 'bea' # weblogic directory
default['peopletools']['weblogic']['home_name'] = 'OraWL1213Home' # weblogic inventory home name
default['peopletools']['weblogic']['tmp_dir'] = 'wl_tmp' # weblogic tmp directory
default['peopletools']['weblogic']['version'] = '12.1.3' # weblogic version

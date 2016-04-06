peopletools Chef cookbook
=====================
The peopletools cookbook provides resources and recipes to install and configure an Oracle PeopleTools stack.  This is based on the Puppet code and archive files in the Oracle DPK bundle (starting with 8.55.01).

Requirements
------------
- Chef 12.5 or higher
- Ruby 2.0 or higher (preferably from the Chef full-stack installer)
- Network accessible package repositories

Platform Support
----------------
The following platforms have been tested with Test Kitchen:
- CentOS
- Red Hat

Usage
-----
#### metadata.rb
Include `peopletools` as a dependency in your cookbook's `metadata.rb`.

```
depends 'peopletools', '= 0.3.3'
```

Copy the tgz archive files for Oracle Inventory, JDK, PS Home, Tuxedo, WebLogic, etc from the Oracle delivered DPK to a repository such as Artifactory.  Configure the default['peopletools']['archive_repo'] attribute to point to the repository location.  Use the recipes or resources to deploy and configure PeopleTools.

Recipes
---------
#### peopletools::default
The default recipe is blank.

#### peopletools::app
Configures resources required for a PeopleTools app server.

#### peopletools::system
Configures system settings such as kernel parameters, users, and groups.

#### peopletools::web
Configures resources required for a PeopleTools web server.

Resources
---------
Deployment:

#### peopletools_inventory
Resource to deploy Oracle Inventory.

#### peopletools_jdk
Resource to deploy Oracle JDK.

#### peopletools_oracle_client
Resource to deploy Oracle Client.

#### peopletools_ps_apphome
Resource to deploy Oracle PS App Home.

#### peopletools_ps_home
Resource to deploy Oracle PS Home.

#### peopletools_tuxedo
Resource to deploy Oracle Tuxedo.

#### peopletools_weblogic
Resource to deploy Oracle WebLogic.

Testing
---------
.kitchen.yml is configured to use vagrant with centos-6.7.  Two environment variables must be configured to set the `['peopletools']['archive_repo']` and `['peopletools']['ps_apphome']['archive_repo']` attribute values.  These should be set to the location of the repositories which hold the archive files for PeopleTools and PS_Apphome.  They can be different locations if required, and should not contain a trailing forward slash.  E.g.

```
PEOPLETOOLS_ARCHIVE_REPO=http://artifacts.local.org/artifactory/software/oracle/peoplesoft/peopletools/8.55.01
PEOPLETOOLS_PS_APPHOME_ARCHIVE_REPO=http://artifacts.local.org/artifactory/software/oracle/peoplesoft/finance/9.2.017
```

Contributing
------------
1. Fork the repository on GitHub.
2. Create a named feature branch (like `add_component_x`).
3. Write your change.
4. Write tests for your change (this cookbook currently uses InSpec with Test Kitchen).
5. Run the tests, ensuring they all pass.
6. Submit a Pull Request using GitHub.

License and Authors
-------------------
Author: Richard Lock

Copyright 2016 University of Derby

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

<http://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

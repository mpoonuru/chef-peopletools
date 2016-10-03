name 'peopletools'
maintainer 'University of Derby'
maintainer_email 'serverteam@derby.ac.uk'
license 'Apache 2.0'
description 'Provides resources to install and configure an Oracle PeopleTools stack'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '2.1.0'
source_url 'https://github.com/universityofderby/chef-peopletools'
issues_url 'https://github.com/universityofderby/chef-peopletools/issues'

depends 'ark', '~> 2.0'

supports 'centos'
supports 'redhat'

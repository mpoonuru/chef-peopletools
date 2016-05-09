name 'peopletools'
maintainer 'University of Derby'
maintainer_email 'serverteam@derby.ac.uk'
license 'Apache 2.0'
description 'Provides resources and recipes to install and configure an Oracle PeopleTools stack'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '1.2.1'
source_url 'https://github.com/universityofderby/chef-peopletools' if respond_to?(:source_url)
issues_url 'https://github.com/universityofderby/chef-peopletools/issues' if respond_to?(:issues_url)

supports 'centos'
supports 'redhat'

depends 'ark', '~> 1.0'
depends 'limits', '~> 1.0'
depends 'sysctl', '~> 0.7'

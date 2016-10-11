# webserver domain directory
describe file('/home/psadm2/webserv/KIT') do
  it { should be_directory }
  its('owner') { should eq 'psadm2' }
  its('group') { should eq 'oinstall' }
  its('mode') { should eq 0o775 }
end

# config.xml
describe file('/home/psadm2/webserv/KIT/config/config.xml') do
  its('owner') { should eq 'psadm2' }
  its('group') { should eq 'oinstall' }
  its('mode') { should eq 0o664 }
  its('content') { should match(%r{<listen-port>443<\/listen-port>}) }
  its('content') { should match(%r{<listen-port>80<\/listen-port>}) }
  its('content') { should match(%r{<node-manager-username>system<\/node-manager-username>}) }
  its('content') { should match(%r{<node-manager-password-encrypted>\{AES\}QhX0VXgZPsavkYU3EjXvi\+FXMrbbo\/wYgUCjUfswZEg=<\/node-manager-password-encrypted>}) }
end

# configuration.properties
describe file('/home/psadm2/webserv/KIT/applications/peoplesoft/PORTAL.war/WEB-INF/psftdocs/ps/configuration.properties') do
  its('owner') { should eq 'psadm2' }
  its('group') { should eq 'oinstall' }
  its('mode') { should eq 0o664 }
  its('content') { should match(/psserver=localhost:9000/) }
  its('content') { should match(/WebProfile=PROD/) }
  its('content') { should match(/WebUserId=\{V1\.1\}JP9ukEkTssmYrzsK1yvXFg==/) }
  its('content') { should match(%r{WebPassword=\{V1\.1\}u7FfJbV\/DgaCEwiK2rgE1A==}) }
  its('content') { should match(%r{ReportRepositoryPath=\/home\/psadm2\/PeopleSoft Internet Architecture\/psreports}) }
end

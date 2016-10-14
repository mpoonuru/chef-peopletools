# webserver domain directory
describe file('/home/psadm2/webserv/KIT') do
  it { should be_directory }
  its('owner') { should eq 'psadm2' }
  its('group') { should eq 'oinstall' }
  its('mode') { should cmp '0775' }
end

# config.xml
describe file('/home/psadm2/webserv/KIT/config/config.xml') do
  its('owner') { should eq 'psadm2' }
  its('group') { should eq 'oinstall' }
  its('mode') { should cmp '0664' }
  its('content') { should match(%r{<listen-port>443<\/listen-port>}) }
  its('content') { should match(%r{<listen-port>80<\/listen-port>}) }
  its('content') { should match(%r{<node-manager-username>system<\/node-manager-username>}) }
  its('content') { should match(%r{<node-manager-password-encrypted>\{AES\}peJxi325lIFdb4\/f265oeE8jL3a0HK7iNigdj6xDSyk=<\/node-manager-password-encrypted>}) }
end

# configuration.properties
describe file('/home/psadm2/webserv/KIT/applications/peoplesoft/PORTAL.war/WEB-INF/psftdocs/ps/configuration.properties') do
  its('owner') { should eq 'psadm2' }
  its('group') { should eq 'oinstall' }
  its('mode') { should cmp '0664' }
  its('content') { should match(/psserver=localhost:9000/) }
  its('content') { should match(%r{DomainConnectionPwd=\{V1\.1\}tQKvkLDesnJg\/26yibKHm\+TgI0o4XUyBpi1taZTD98I=}) }
  its('content') { should match(/WebProfile=PROD/) }
  its('content') { should match(/WebUserId={V1\.1}JP9ukEkTssmYrzsK1yvXFg==/) }
  its('content') { should match(%r{WebPassword=\{V1\.1\}u7FfJbV\/DgZNJSQEtCGgSNmYI\/BgQ\+X6}) }
  its('content') { should match(%r{ReportRepositoryPath=\/home\/psadm2\/PeopleSoft Internet Architecture\/psreports}) }
end

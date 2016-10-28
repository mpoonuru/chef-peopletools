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
  [
    '<listen-port>443</listen-port>',
    '<listen-port>80</listen-port>',
    '<node-manager-username>system</node-manager-username>',
    '<node-manager-password-encrypted>\{AES\}.*</node-manager-password-encrypted>'
  ].each do |c|
    its('content') { should match c }
  end
end

# configuration.properties
describe file('/home/psadm2/webserv/KIT/applications/peoplesoft/PORTAL.war/WEB-INF/psftdocs/ps/configuration.properties') do
  its('owner') { should eq 'psadm2' }
  its('group') { should eq 'oinstall' }
  its('mode') { should cmp '0664' }
  [
    'psserver=localhost:9000',
    'DomainConnectionPwd=\{V1\.1\}tQKvkLDesnJg/26yibKHm\+TgI0o4XUyBpi1taZTD98I=',
    'WebProfile=PROD',
    'WebUserId={V1\.1}JP9ukEkTssmYrzsK1yvXFg==',
    'WebPassword=\{V1\.1\}u7FfJbV/DgZNJSQEtCGgSNmYI/BgQ\+X6',
    'ReportRepositoryPath=/home/psadm2/PeopleSoft Internet Architecture/psreports'
  ].each do |c|
    its('content') { should match c }
  end
end

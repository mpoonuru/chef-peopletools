# tnsnames.ora
describe file('/home/psadm2/.bashrc') do
  its('owner') { should eq 'psadm2' }
  its('group') { should eq 'oinstall' }
  its('mode') { should cmp '0644' }
  its('content') { should match(%r{export _JAVA_OPTIONS=-Djava\.security\.egd=file:\/dev\/\.\/urandom}) }
  its('content') { should match(%r{export COBDIR=\/opt\/microfocus\/cobol}) }
  its('content') { should match(%r{export ORACLE_HOME=\/opt\/oracle\/psft\/pt\/oracle-client/12\.1\.0\.2}) }
  its('content') { should match(%r{export TUXDIR=\/opt\/oracle\/psft\/pt\/bea\/tuxedo\/tuxedo12\.1\.3\.0\.0}) }
  its('content') { should match(%r{export PATH=\/opt\/oracle\/psft\/pt\/ps_home8\.55\.05\/appserv:\/opt\/oracle\/psft\/pt\/ps_home8\.55\.05\/setup:\$PATH}) }
  its('content') { should match(%r{cd \/opt\/oracle\/psft\/pt\/ps_home8\.55\.05 && \. psconfig\.sh}) }
  its('content') { should match(%r{export PS_CFG_HOME=\/home\/psadm2}) }
  its('content') { should match(%r{export PS_APP_HOME=\/opt\/oracle\/psft\/pt\/ps_app_home}) }
end

# .bashrc
describe file('/home/psadm2/.bashrc') do
  its('owner') { should eq 'psadm2' }
  its('group') { should eq 'oinstall' }
  its('mode') { should cmp '0644' }
  [
    'export _JAVA_OPTIONS=-Djava\.security\.egd=file:/dev/\./urandom',
    'export COBDIR=/opt/microfocus/cobol',
    'export ORACLE_HOME=/opt/oracle/psft/pt/oracle-client/12\.1\.0\.2',
    'export TUXDIR=/opt/oracle/psft/pt/bea/tuxedo/tuxedo12\.1\.3\.0\.0',
    'export PATH=/opt/oracle/psft/pt/ps_home8\.55\.05/appserv:/opt/oracle/psft/pt/ps_home8\.55\.05/setup:\$PATH',
    'cd /opt/oracle/psft/pt/ps_home8\.55\.05 && \. psconfig\.sh',
    'export PS_CFG_HOME=/home/psadm2',
    'export PS_APP_HOME=/opt/oracle/psft/pt/ps_app_home'
  ].each do |c|
    its('content') { should match c }
  end
end

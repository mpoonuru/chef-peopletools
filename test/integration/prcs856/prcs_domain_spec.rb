# prcs domain directory
describe file('/home/psadm2/appserv/prcs/KIT') do
  it { should be_directory }
  its('owner') { should eq 'psadm2' }
  its('group') { should eq 'oinstall' }
  its('mode') { should cmp '0775' }
end

# psprcs.cfg
describe file('/home/psadm2/appserv/prcs/KIT/psprcs.cfg') do
  its('owner') { should eq 'psadm2' }
  its('group') { should eq 'oinstall' }
  its('mode') { should cmp '0775' }
  [
    'Allow Dynamic Changes=Y',
    'SMTPServer=localhost',
    'DBName=KITCHEN',
    'DBType=ORACLE',
    'PrcsServerName=PSUNX',
    'UserId=opr_user_id',
    'UserPswd=\{V1\}',
    'ConnectId=connect_id',
    'ConnectPswd=\{V1\}',
    'LogDir=%PS_SERVDIR%\\\log_output',
    'SQRBIN=%PS_HOME%/bin/sqr/%PS_DB%/bin',
    'Add to PATH=',
    'DomainConnectionPwd=\{V1\}'
  ].each do |c|
    its('content') { should match c }
  end
end

# psprcsrv.ubb
describe file('/home/psadm2/appserv/prcs/KIT/psprcsrv.ubb') do
  its('owner') { should eq 'psadm2' }
  its('group') { should eq 'oinstall' }
  its('mode') { should cmp '0644' }
  [
    '\{APPENG\}:\s*TRUE',
    '\{MSTRSRV\}:\s*TRUE',
    '\{PPM\}:\s*FALSE',
    '\{DOMAIN_GW\}:\s*FALSE',
    '\{SERVER_EVENTS\}:\s*FALSE'
  ].each do |c|
    its('content') { should match c }
  end
end

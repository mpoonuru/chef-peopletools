# appserver domain directory
describe file('/home/psadm2/appserv/KIT') do
  it { should be_directory }
  its('owner') { should eq 'psadm2' }
  its('group') { should eq 'oinstall' }
  its('mode') { should cmp '0755' }
end

# psappsrv.cfg
describe file('/home/psadm2/appserv/KIT/psappsrv.cfg') do
  its('owner') { should eq 'psadm2' }
  its('group') { should eq 'oinstall' }
  its('mode') { should cmp '0775' }
  [
    'Allow Dynamic Changes=Y',
    'Domain ID=KIT',
    'SMTPServer=localhost',
    'DBName=KITCHEN',
    'DBType=ORACLE',
    'UserId=opr_user_id',
    'UserPswd=jDXqb7hxyNrGCviAZ40ZjDdMrl5D1K0KB0eqtWgtpBc=',
    'Add to PATH=',
    'ConnectId=connect_id',
    'ConnectPswd=gCr2Xqhh2ffaDxbxxO0DUad7IjStsAxfLiJ03FkO',
    'DomainConnectionPwd=hyr1UaRs8stNYVB5aYZgVHCc0e0aeBEE7MGkDhHg'
  ].each do |c|
    its('content') { should match c }
  end
end

# psappsrv.ubb
describe file('/home/psadm2/appserv/KIT/psappsrv.ubb') do
  its('owner') { should eq 'psadm2' }
  its('group') { should eq 'oinstall' }
  its('mode') { should cmp '0644' }
  [
    '\{PUBSUB\}:\s*FALSE',
    '\{QUICKSRV\}:\s*FALSE',
    '\{QUERYSRV\}:\s*TRUE',
    '\{JOLT\}:\s*TRUE',
    '\{JRAD\}:\s*FALSE',
    '\{WSL\}:\s*TRUE',
    '\{DBGSRV\}:\s*FALSE',
    '\{RENSRV\}:\s*FALSE',
    '\{MCF\}:\s*FALSE',
    '\{PPM\}:\s*FALSE',
    '\{ANALYTICSRV\}:\s*FALSE',
    '\{DOMAIN_GW\}:\s*FALSE',
    '\{SERVER_EVENTS\}:\s*FALSE'
  ].each do |c|
    its('content') { should match c }
  end
end

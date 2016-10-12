# prcs domain directory
describe file('/home/psadm2/appserv/prcs/KIT') do
  it { should be_directory }
  its('owner') { should eq 'psadm2' }
  its('group') { should eq 'oinstall' }
  its('mode') { should eq 0o775 }
end

# psprcs.cfg
describe file('/home/psadm2/appserv/prcs/KIT/psprcs.cfg') do
  its('owner') { should eq 'psadm2' }
  its('group') { should eq 'oinstall' }
  its('mode') { should eq 0o775 }
  its('content') { should match(/Allow Dynamic Changes=Y/) }
  its('content') { should match(/SMTPServer=localhost/) }
  its('content') { should match(/DBName=KITCHEN/) }
  its('content') { should match(/DBType=ORACLE/) }
  its('content') { should match(/PrcsServerName=PSUNX/) }
  its('content') { should match(/UserId=opr_user_id/) }
  its('content') { should match(/UserPswd=jDXqb7hxyNrGCviAZ40ZjDdMhnh5upc2L5EOUCtI0W8=/) }
  its('content') { should match(/ConnectId=connect_id/) }
  its('content') { should match(%r{ConnectPswd=gCr2Xqhh2ffaDxbxxO0DUad7IjStsAweK0kJ\/vnb}) }
  its('content') { should match(/LogDir=%PS_SERVDIR%\\log_output/) }
  its('content') { should match(%r{SQRBIN=%PS_HOME%\/bin\/sqr\/%PS_DB%\/bin}) }
  its('content') { should match(/Add to PATH=/) }
  its('content') { should match(/DomainConnectionPwd=hyr1UaRs8stNYVB5aYZgVHCc0e0aeBEE7MGkDhHg/) }
end

# psprcsrv.ubb
describe file('/home/psadm2/appserv/prcs/KIT/psprcsrv.ubb') do
  its('owner') { should eq 'psadm2' }
  its('group') { should eq 'oinstall' }
  its('mode') { should eq 0o644 }
  its('content') { should match(/\{APPENG\}:\s*TRUE/) }
  its('content') { should match(/\{MSTRSRV\}:\s*TRUE/) }
  its('content') { should match(/\{PPM\}:\s*FALSE/) }
  its('content') { should match(/\{DOMAIN_GW\}:\s*FALSE/) }
  its('content') { should match(/\{SERVER_EVENTS\}:\s*FALSE/) }
end

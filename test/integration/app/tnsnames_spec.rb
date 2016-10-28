# tnsnames.ora
describe file('/opt/oracle/psft/pt/oracle-client/12.1.0.2/network/admin/tnsnames.ora') do
  its('owner') { should eq 'oracle' }
  its('group') { should eq 'oinstall' }
  its('mode') { should cmp '0644' }
  [
    'KITCHEN =',
    '\(ADDRESS = \(PROTOCOL = TCP\)\(HOST = localhost\)\(PORT = 1521\)\)',
    '\(SERVER = DEDICATED\)',
    '\(SERVICE_NAME = KITCHEN\)'
  ].each do |c|
    its('content') { should match c }
  end
end

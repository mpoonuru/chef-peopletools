# tnsnames.ora
describe file('/opt/oracle/psft/pt/oracle-client/12.1.0.2/network/admin/tnsnames.ora') do
  its(:owner) { should eq 'oracle' }
  its(:group) { should eq 'oinstall' }
  its(:mode) { should eq 0644 }
  its(:content) { should match(/KITCHEN =/) }
  its(:content) { should match(/\(ADDRESS = \(PROTOCOL = TCP\)\(HOST = localhost\)\(PORT = 1521\)\)/) }
  its(:content) { should match(/\(SERVER = DEDICATED\)/) }
  its(:content) { should match(/\(SERVICE_NAME = KITCHEN\)/) }
end

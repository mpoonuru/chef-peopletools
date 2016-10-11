# directories
['/opt/oracle/psft/pt',
 '/opt/oracle/psft/pt/oracle-client/12.1.0.2',
 '/opt/oracle/psft/pt/oracle-client/12.1.0.2/bin'
].each do |d|
  describe file(d) do
    it { should be_directory }
    it { should be_mode 0755 }
  end
end

# inventory
['/opt/oracle/psft/db/oraInventory/oraInst.loc',
 '/opt/oracle/psft/pt/bea/tuxedo/oraInst.loc'
].each do |f|
  describe file(f) do
    its('content') { should match(%r{inventory_loc=\/opt\/oracle\/psft\/db\/oraInventory}) }
    its('content') { should match(/inst_group=oinstall/) }
  end
end

# oracle_client home in inventory
describe file('/opt/oracle/psft/db/oraInventory/ContentsXML/inventory.xml') do
  its('content') { should match(%r{\<HOME NAME="OraClient12cHome" LOC="\/opt\/oracle\/psft\/pt\/oracle-client\/12.1.0.2" TYPE="O"}) }
end

# oracle_client runInstaller
describe file('/opt/oracle/psft/pt/oracle-client/12.1.0.2/oui/bin/runInstaller') do
  it { should be_file }
end

# oracle_client tmp directory
describe file('/opt/oracle/psft/pt/oracle-client/12.1.0.2/oc_tmp') do
  it { should_not exist }
end

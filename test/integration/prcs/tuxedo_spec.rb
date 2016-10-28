# directories
[
  '/opt/oracle/psft/pt',
  '/opt/oracle/psft/pt/bea/tuxedo',
  '/opt/oracle/psft/pt/bea/tuxedo/tuxedo12.1.3.0.0'
].each do |d|
  describe file(d) do
    it { should be_directory }
    its('owner') { should eq 'psadm1' }
    its('group') { should eq 'oinstall' }
    its('mode') { should cmp '0755' }
  end
end

# inventory
[
  '/opt/oracle/psft/db/oraInventory/oraInst.loc',
  '/opt/oracle/psft/pt/bea/tuxedo/oraInst.loc'
].each do |f|
  describe file(f) do
    its('content') { should match 'inventory_loc=/opt/oracle/psft/db/oraInventory' }
    its('content') { should match 'inst_group=oinstall' }
  end
end

# tuxedo home in inventory
describe file('/opt/oracle/psft/db/oraInventory/ContentsXML/inventory.xml') do
  its('content') { should match '\<HOME NAME="OraTux1213Home" LOC="/opt/oracle/psft/pt/bea/tuxedo" TYPE="O"' }
end

# tuxedo runInstaller
describe file('/opt/oracle/psft/pt/bea/tuxedo/oui/bin/runInstaller') do
  it { should be_file }
end

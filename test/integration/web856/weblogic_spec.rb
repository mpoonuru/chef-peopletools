# directories
describe file('/opt/oracle/psft/pt') do
  it { should be_directory }
  its('owner') { should eq 'psadm1' }
  its('group') { should eq 'oinstall' }
  its('mode') { should cmp '0755' }
end

[
  '/opt/oracle/psft/pt/bea/',
  '/opt/oracle/psft/pt/bea/wlserver'
].each do |d|
  describe file(d) do
    it { should be_directory }
    its('owner') { should eq 'psadm1' }
    its('group') { should eq 'oinstall' }
    its('mode') { should cmp '0775' }
  end
end

# inventory
[
  '/opt/oracle/psft/db/oraInventory/oraInst.loc',
  '/opt/oracle/psft/pt/bea/oraInst.loc'
].each do |f|
  describe file(f) do
    its('content') { should match 'inventory_loc=/opt/oracle/psft/db/oraInventory' }
    its('content') { should match 'inst_group=oinstall' }
  end
end

# weblogic home in inventory
describe file('/opt/oracle/psft/db/oraInventory/ContentsXML/inventory.xml') do
  its('content') { should match '\<HOME NAME="OraWLHome" LOC="/opt/oracle/psft/pt/bea" TYPE="O"' }
end

# weblogic tmp directory
describe file('/opt/oracle/psft/pt/wl_tmp') do
  it { should_not exist }
end

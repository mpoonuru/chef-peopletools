# directories
describe file('/opt/oracle/psft/pt') do
  it { should be_directory }
  its('mode') { should eq 0755 }
  its('owner') { should eq 'psadm1' }
  its('group') { should eq 'oinstall' }
end

['/opt/oracle/psft/pt/bea/',
 '/opt/oracle/psft/pt/bea/wlserver'
].each do |d|
  describe file(d) do
    it { should be_directory }
    its('mode') { should eq 0775 }
    its('owner') { should eq 'psadm1' }
    its('group') { should eq 'oinstall' }
  end
end

# inventory
['/opt/oracle/psft/db/oraInventory/oraInst.loc',
 '/opt/oracle/psft/pt/bea/oraInst.loc'
].each do |f|
  describe file(f) do
    its(:content) { should match(%r{inventory_loc=\/opt\/oracle\/psft\/db\/oraInventory}) }
    its(:content) { should match(/inst_group=oinstall/) }
  end
end

# weblogic home in inventory
describe file('/opt/oracle/psft/db/oraInventory/ContentsXML/inventory.xml') do
  its(:content) { should match(%r{\<HOME NAME="OraWL1213Home" LOC="\/opt\/oracle\/psft\/pt\/bea" TYPE="O"}) }
end

# weblogic .product.properties
describe file('/opt/oracle/psft/pt/bea/wlserver/.product.properties') do
  its(:content) { should match(%r{JAVA_HOME=\/opt\/oracle\/psft\/pt\/jdk1.7.0_95}) }
  its(:content) { should match(%r{PLATFORMHOME=\/opt\/oracle\/psft\/pt\/bea\/wlserver}) }
end

# weblogic tmp directory
describe file('/opt/oracle/psft/pt/wl_tmp') do
  it { should_not exist }
end

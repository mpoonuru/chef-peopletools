# directories
[
  '/opt/oracle/psft/pt',
  '/opt/oracle/psft/pt/ps_home8.56.10'
].each do |d|
  describe file(d) do
    it { should be_directory }
    its('mode') { should cmp '0755' }
  end
end

# peopletools.properties
describe file('/opt/oracle/psft/pt/ps_home8.56.10/peopletools.properties') do
  its('content') { should match 'dbtype=ORA' }
end

# psadmin
describe file('/opt/oracle/psft/pt/ps_home8.56.10/bin/psadmin') do
  it { should be_file }
end

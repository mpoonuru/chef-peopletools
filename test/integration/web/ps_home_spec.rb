# directories
['/opt/oracle/psft/pt',
  '/opt/oracle/psft/pt/ps_home8.55.01'
].each do |d|
  describe file(d) do
    it { should be_directory }
    it { should be_mode 0755 }
  end
end

# peopletools.properties
describe file('/opt/oracle/psft/pt/ps_home8.55.01/peopletools.properties') do
  its(:content) { should match(/dbtype=ORA/) }
end

# psadmin
describe file('/opt/oracle/psft/pt/ps_home8.55.01/bin/psadmin') do
  it { should be_file }
end

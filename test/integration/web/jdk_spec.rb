# directories
['/opt/oracle/psft/pt',
  '/opt/oracle/psft/pt/jdk1.7.0_91',
  '/opt/oracle/psft/pt/jdk1.7.0_91/bin'
].each do |d|
  describe file(d) do
    it { should be_directory }
    it { should be_mode 0755 }
  end
end

# java version
describe command('/opt/oracle/psft/pt/jdk1.7.0_91/bin/java -version') do
  its(:stderr) { should match(/java version \"1.7.0_91\"/) }
  its(:exit_status) { should eq 0 }
end

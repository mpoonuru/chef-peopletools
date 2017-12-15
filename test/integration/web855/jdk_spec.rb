# directories
[
  '/opt/oracle/psft/pt',
  '/opt/oracle/psft/pt/jdk1.7.0_151',
  '/opt/oracle/psft/pt/jdk1.7.0_151/bin'
].each do |d|
  describe file(d) do
    it { should be_directory }
    its('mode') { should cmp '0755' }
  end
end

# java version
describe command('/opt/oracle/psft/pt/jdk1.7.0_151/bin/java -version') do
  its('exit_status') { should eq 0 }
  its('stderr') { should match 'java version \"1\.7\.0_151\"' }
end

# kernel parameters
{ 'kernel.core_uses_pid' => 1,
  'kernel.msgmnb' => 65_538,
  'kernel.msgmni' => 1024,
  'kernel.msgmax' => 65_536,
  'kernel.shmmax' => 68_719_476_736,
  'kernel.shmall' => 4_294_967_296,
  'kernel.shmmni' => 4096,
  'net.ipv4.tcp_keepalive_time' => 90,
  'net.ipv4.tcp_timestamps' => 1,
  'net.ipv4.tcp_window_scaling' => 1
}.each do |p, v|
  describe kernel_parameter(p) do
    its(:value) { should eq v }
  end
end

describe kernel_parameter('net.ipv4.ip_local_port_range') do
  its(:value) { should match(/10000\t65500/) }
end

# groups
%w(psft appinst oinstall dba).each do |g|
  describe group(g) do
    it { should exist }
  end
end

# users
{ 'psadm1' => 'oinstall',
  'psadm2' => 'oinstall',
  'psadm3' => 'appinst',
  'oracle' => 'oinstall'
}.each do |u, g|
  describe user(u) do
    its(:group) { should eq g }
    its(:home) { should eq "/home/#{u}" }
  end
end

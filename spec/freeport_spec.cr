require "./spec_helper"

describe FreePort do
  it "returns a free port" do
    port = FreePort.get?
    port.should_not be_nil
  end
  it "returns a port in the local TCP port range" do
    port = FreePort.get
    range = File.read("/proc/sys/net/ipv4/ip_local_port_range").chomp.split '\t'
    (range.first.to_i32..range.last.to_i32).should contain port
  end
  it "returns a usable port" do
    server = TCPServer.new FreePort.get
    delay 2 do
      `/bin/bash -c "echo '#{TEST_MESSAGE}' > /dev/tcp/localhost/#{server.local_address.port}"`
    end
    server.accept?.try &.gets.should eq TEST_MESSAGE
    server.close
  end
end

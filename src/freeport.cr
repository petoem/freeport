require "socket"

module FreePort
  VERSION = {{ `shards version #{__DIR__}`.chomp.stringify }}
  extend self

  # Returns a free and open TCP port, could raise an exception.
  def get
    tcp_server = TCPServer.new Socket::IPAddress::LOOPBACK, 0, reuse_port: false
    port = tcp_server.local_address.port
    tcp_server.close
    port
  end

  # Returns a free and open TCP port or `nil`.
  def get?
    FreePort.get
  rescue
    nil
  end
end

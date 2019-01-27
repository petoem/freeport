require "./freeport"
require "option_parser"

newline = false

OptionParser.parse! do |parser|
  parser.banner = "Usage: freeport [arguments]"
  parser.on("-n", "--newline", "Print port number with a newline") { newline = true }
  parser.on("-v", "--version", "Output version information and exit") { puts FreePort::VERSION; exit 0 }
  parser.on("-h", "--help", "Show this help") { puts parser; exit 0 }
  parser.invalid_option do |flag|
    STDERR.puts "ERROR: #{flag} is not a valid option."
    STDERR.puts parser
    exit 1
  end
end

begin
  port = FreePort.get
  STDOUT << port
  STDOUT.puts if newline
rescue exception
  STDERR.puts exception.message
end

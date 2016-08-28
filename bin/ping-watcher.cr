require "option_parser"
require "../src/ping_watcher"

OptionParser.parse! do |parser|
  parser.banner = "Usage: ping-watcher [options]"
  parser.on("-v", "--version", "Show version") { puts PingWatcher::VERSION; exit 0 }
  parser.on("-h", "--help", "Show this help") { puts parser; exit 0 }
end

PingWatcher.run

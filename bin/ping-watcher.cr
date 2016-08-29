require "option_parser"
require "../src/ping_watcher"

options = {
  count: 10 * 60,
  sleep: 1
} of Symbol => Int32|Float32
OptionParser.parse! do |parser|
  parser.banner = "Usage: ping-watcher [options]"

  parser.on("-c=COUNT", "--count=COUNT", "How often to run. Default: 10 minutes") do |c|
    options[:count] = c.to_i
  end

  parser.on("-s=SECONDS", "--sleep=SECONDS", "How long to sleep between tests. Default: 1 second") do |s|
    options[:sleep] = s.to_f32
  end

  parser.on("-v", "--version", "Show version") do
    puts PingWatcher::VERSION
    exit 0
  end

  parser.on("-h", "--help", "Show this help") do
    puts parser
    exit 0
  end
end

raise "Need host argument" unless ARGV.size == 1

PingWatcher.run(ARGV[0], options)

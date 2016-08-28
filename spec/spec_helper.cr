require "spec"
require "../src/ping_watcher"

class Helper
  def self.sh(command, fail = false)
    result = `#{command}`
    raise "FAIL #{command}: #{result}" if $?.success? == fail
    result
  end

  def self.watch(args)
    sh "crystal run bin/ping-watcher.cr -- #{args}"
  end
end

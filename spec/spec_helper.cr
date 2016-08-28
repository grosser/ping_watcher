require "spec"
require "tempfile"

require "../src/ping_watcher"

class Helper
  def self.sh(command, fail = false)
    result = `#{command}`
    raise "FAIL #{command}: #{result}" if $?.success? == fail
    result
  end

  def self.watch(args)
    sh "#{binary} #{args}"
  end

  private def self.binary
    @@binary ||= begin
      temp = Tempfile.new("ping-watch")
      Helper.sh("crystal build bin/ping-watcher.cr -o #{temp.path}")
      Helper.sh("chmod +x #{temp.path}") # maybe not needed ...
      temp.close
      temp.path
    end
  end
end

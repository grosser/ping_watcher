require "./ping_watcher/*"

module PingWatcher
  TIME_FORMAT = "%.3fms"

  def self.run(host, options)
    failures = 0
    times = [] of Float32
    count = options.fetch(:count).to_i
    average = nil

    (1..count).each do |current|
      # check connection
      result = `ping  -c 1 -t 1 #{host} 2>&1`
      result = if $?.success?
        time = result[/time=(\d\.\d+) ms/, 1].to_f32
        times << time
        TIME_FORMAT % time
      else
        failures += 1
        "FAIL #{result}"
      end

      # report status
      average = TIME_FORMAT % (times.sum / times.size)
      puts "#{current}/#{count}: #{result}, failures: #{failures}, average: #{average}"

      sleep options.fetch(:sleep) unless current == count
    end

    # print results
    failure_rate = failures.to_f * 100 / count
    average = times.sum / times.size
    rating = if failure_rate > 5
      "Bad, failure rate #{failure_rate.to_i}%"
    elsif average > 0.1 # slower then 100ms
      "Slow, #{TIME_FORMAT % average} average"
    elsif failure_rate != 0
      "Good, #{average} average"
    else
      "Excellent"
    end

    puts rating
  end
end

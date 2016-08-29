require "./spec_helper"

describe PingWatcher do
  describe "CLI" do
    it "shows version" do
      Helper.watch("-v").should eq "#{PingWatcher::VERSION}\n"
      Helper.watch("--version").should eq "#{PingWatcher::VERSION}\n"
    end

    it "shows help" do
      Helper.watch("-h").should contain "Show this help"
      Helper.watch("--help").should contain "Show this help"
    end

    it "fails with multiple arguments" do
      Helper.watch("foo bar", true).should contain "Need host argument"
    end

    it "prints good results" do
      result = Helper.watch("127.0.0.1 -c 100 -s 0")
      result.should contain "Excellent"
    end

    it "prints bad results" do
      result = Helper.watch("missing -c 100 -s 0")
      result.should contain "Bad, failure rate 100%"
    end

    it "does not sleep on last iteration" do
      Helper.binary # trigger build so it does not fail when run alone
      result = Benchmark.realtime { Helper.watch("localhost -c 1 -s 1") }
      result.to_f.should be < 1.0
    end
  end
end

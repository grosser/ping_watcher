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

    it "prints results" do
      result = Helper.watch("localhost -c 100 -s 0")
      result.should contain "Rating: Excellent"
    end
  end
end

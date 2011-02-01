require 'spec_helper'

describe "Reporters" do
  it "calls the reporters in order" do
    r1 = DiffReporter.new
    r2 = DiffReporter.new

    Approvals.reporter(r1)
    Approvals.get_default_reporter.should == r1

    Approvals.reporter(r2)
    Approvals.get_default_reporter.should == r2

    Approvals.unregister_last_reporter
    Approvals.get_default_reporter.should == r1
  end
end

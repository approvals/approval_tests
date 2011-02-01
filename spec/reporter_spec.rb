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

  it "one-use reporters" do
    r1 = DiffReporter.new
    r2 = DiffReporter.new

    Approvals.reporter(r1)
    Approvals.get_default_reporter.should == r1

    Approvals.single_use_reporter(r2)
    Approvals.get_default_reporter.should == r2

    Approvals.get_default_reporter.should == r1
  end

  it "indecisive single use" do
    r1 = DiffReporter.new
    Approvals.single_use_reporter(r1)
    Approvals.unregister_last_reporter
    Approvals.single_use_reporter(r1)
    Approvals.get_default_reporter.should_not be_nil
  end

  it "one-use reporter, expiration" do
    r1 = DiffReporter.new
    r2 = DiffReporter.new
    r3 = DiffReporter.new

    Approvals.reporter(r1)
    Approvals.get_default_reporter.should == r1

    Approvals.single_use_reporter(r2)
    Approvals.single_use_reporter(r3)

    Approvals.get_default_reporter.should == r3

    Approvals.get_default_reporter.should == r1
  end

end

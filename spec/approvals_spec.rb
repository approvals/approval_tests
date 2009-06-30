require File.join(File.dirname(__FILE__), "spec_helper")

shared_examples_for "Shared Behaviors" do
  it "should approve shared behaviors" do
    Approvals.approve("shared behavior test")
  end
end

describe "Approvals" do 
  after(:each) do
    Approvals.unregister_last_reporter()
  end
  
  it_should_behave_like "Shared Behaviors"
  
  it "should successfully approve text" do
    Approvals.approve("should be approved")
  end
  
  it "should raise mismatch error if received does not match approved" do
    Approvals.register_reporter(CleanupReporter.new);
    lambda { Approvals.approve("should fail with mismatch") }.should raise_error(ApprovalError)
  end
  
  it "should raise missing approval error if has not been approved yet" do
    Approvals.register_reporter(CleanupReporter.new);
    lambda { Approvals.approve("should fail with a missing ") }.should raise_error(ApprovalError)
  end  
  
  describe "Multiple describes" do
    it "should approve multiple describes" do
      Approvals.approve("multiple describes")
    end
  end
end

describe "Approvals", "using approval blocks" do
  approve "the last statement" do
    "approve this"
  end
  
end
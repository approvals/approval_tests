require File.join(File.dirname(__FILE__), "spec_helper")

shared_examples_for "Shared Behaviors" do
  it "should approve shared behaviors" do
    approve("shared behavior test")
  end
end

describe "Approvals" do 
  it_should_behave_like "Shared Behaviors"
  
  it "should successfully approve text" do
    approve("should be approved")
  end
  
  it "should raise mismatch error if received does not match approved" do
    register_reporter(CleanupReporter.new);
    lambda { approve("should fail with mismatch") }.should raise_error(RuntimeError)
  end
  
  it "should raise missing approval error if has not been approved yet" do
    register_reporter(CleanupReporter.new);
    lambda { approve("should fail with a missing exception") }.should raise_error(RuntimeError)
  end
  
  describe "Multiple describes" do
    it "should approve multiple describes" do
      approve("multiple describes")
    end
  end
end
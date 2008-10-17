require File.join(File.dirname(__FILE__), "spec_helper")

shared_examples_for "Shared Behaviors" do
  it "should approve shared behaviors" do
    approve_text("shared behavior test")
  end
end

describe "Approvals" do 
  include Approvals
  it_should_behave_like "Shared Behaviors"
  
  it "should pass" do 
    are_files_same("passing.txt", "expected.txt" ).should == true
  end

  it "should fail" do
    are_files_same("failing.txt", "expected.txt").should == false
  end

  it "should fail when doesn't exist" do
    are_files_same("failng.txt", "non_existing.txt").should == false
  end

  it "should get name" do   
    spec_name.should == "approvals_should_get_name"
  end
  
  it "should approve" do
    approve_text("approve this")
  end
  
  describe "Multiple describes" do
    it "should approve multiple describes" do
      approve_text("multiple describes")
    end
  end
end
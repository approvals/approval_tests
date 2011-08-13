require "spec_helper"

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
    Approvals.reporter(CleanupReporter.new);
    lambda { Approvals.approve("should fail with mismatch") }.should raise_error(ApprovalError)
  end

  it "should raise missing approval error if has not been approved yet" do
    Approvals.reporter(CleanupReporter.new);
    lambda { Approvals.approve("should fail with a missing ") }.should raise_error(ApprovalError)
  end  

  describe "Multiple describes" do
    it "should approve multiple describes" do
      Approvals.approve("multiple describes")
    end
  end

  describe "lists" do
    it "should write arrays" do
      Approvals.approve_list("name",["tom","dick","harry"])
    end
    it "should show empty lists" do
      Approvals.approve_list("tv", [])
    end
    it "should write maps" do
      Approvals.approve_map(:name=> "harry", :age => 25, :sex => "male")
    end
  end

  describe "xml" do
    it "should be pretty" do
      Approvals.approve_xml('<?xml version="1.0" encoding="ISO-8859-1"?><data><a><b>Bee</b><c>Sea</c></a></data>')
    end
  end

  describe "DiffReporter" do
    it "should launch" do
      base = "approval_tests/spec/"
      #   DiffReporter.instance.report("approval_tests/spec/a.txt", "approval_tests/spec/b.txt")    
    end 
    it "should create and launch" do
      base = "approval_tests/spec/"
      File.delete("#{base}c.txt") if File.exists?("#{base}c.txt")
      #     DiffReporter.instance.report("#{base}c.txt", "#{base}a.txt")    
    end
  end
end

describe "Approvals", "using approval blocks" do
  approve "the last statement" do
    "approve this"
  end
end

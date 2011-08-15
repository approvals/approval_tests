require "spec_helper"

describe '#program_exists' do
  it "should recognize a command that exists" do
    ApprovalTests::Utils.program_exists('ls').should be_true
  end

  it "should not recognize weird commands" do
    ApprovalTests::Utils.program_exists('weirdo-commando').should be_false
  end
end

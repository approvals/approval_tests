__DIR__ = File.dirname(__FILE__)

$LOAD_PATH.unshift __DIR__ unless
  $LOAD_PATH.include?(__DIR__) ||
  $LOAD_PATH.include?(File.expand_path(__DIR__))

require "approval_tests/approvals"

include ApprovalTests::Namers

Spec::Runner.configure do |config|
  config.before(:each) do
    @namer = RSpecNamer.new()
    @namer.approval_name = "#{self.class.description}.#{self.description}"
    @namer.source_file_path = File.dirname(self.class.spec_path)
  end
  config.include(ApprovalTests::Approvals)
end
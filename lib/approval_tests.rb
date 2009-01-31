__DIR__ = File.dirname(__FILE__)

$LOAD_PATH.unshift __DIR__ unless
  $LOAD_PATH.include?(__DIR__) ||
  $LOAD_PATH.include?(File.expand_path(__DIR__))

require "approval_tests/approvals"
require "approval_tests/extensions/rspec"

include ApprovalTests::Namers
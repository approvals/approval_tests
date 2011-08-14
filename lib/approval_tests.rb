__DIR__ = File.dirname(__FILE__)

$LOAD_PATH.unshift __DIR__ unless
  $LOAD_PATH.include?(__DIR__) ||
  $LOAD_PATH.include?(File.expand_path(__DIR__))

require "approval_tests/extensions/rspec"

require "approval_tests/utils"
require "approval_tests/namers"
require "approval_tests/approvers/file_approver"

require "approval_tests/writers"
require "approval_tests/reporters"

require "approval_tests/approvals"

include ApprovalTests::Approvers
include ApprovalTests::Writers
include ApprovalTests::Reporters
include ApprovalTests::Namers

module ApprovalTests
  class ApprovalError < Exception
    attr_accessor :received_filename
    attr_accessor :approved_filename
  end
end
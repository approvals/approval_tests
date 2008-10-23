require 'fileutils'
__DIR__ = File.dirname(__FILE__)
require "#{__DIR__}/namers/rspec_namer"
require "#{__DIR__}/approvers/file_approver"
require "#{__DIR__}/writers/approval_text_writer"
require "#{__DIR__}/reporters/quiet_reporter"
require "#{__DIR__}/reporters/text_mate_reporter"

include ApprovalTests::Approvers
include ApprovalTests::Writers
include ApprovalTests::Reporters

module ApprovalTests
  module Approvals
    def approve(data)
      approver = FileApprover.new(ApprovalTextWriter.new(data), @namer)
      if approver.approve()
  			approver.clean_up_after_success()
  		else
  		  @reporter = get_default_reporter()
  			approver.report_failure(@reporter)

        if @reporter.approved_when_reported()
  				approver.clean_up_after_sucess()
  			else
  				approver.fail()
        end
  	  end
    end
    
    def get_default_reporter()
      @reporters ||= []
      return @reporters.first() unless @reporters.empty?
      if defined? Spec::Mate
        TextMateReporter.instance
      else
        QuietReporter.instance
      end
    end
  
    def register_reporter(reporter)
      @reporters ||= []
      @reporters.push(reporter);
    end
  
    def unregister_reporter(reporter)
      @reporters.remove(reporter);
    end
  
    def unregister_last_reporter()
      @reporters.pop()
    end

  end
end
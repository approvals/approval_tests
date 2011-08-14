require 'fileutils'

require "approval_tests/utils"
require "approval_tests/namers"
require "approval_tests/approvers/file_approver"

require "approval_tests/writers"
require "approval_tests/reporters"

include ApprovalTests::Approvers
include ApprovalTests::Writers
include ApprovalTests::Reporters

module ApprovalTests
  class ApprovalError < Exception
    attr_accessor :received_filename
    attr_accessor :approved_filename
  end
  class Approvals
    class << self
      def approve_list(label, list)
        format = if list.empty?
          "#{label}.count = 0"
        else
          index = -1
          list.reduce("") do |format, list_element| 
            index += 1
            format + "#{label}[#{index}] = #{list_element} \n"
          end
        end
        
        approve(format)
      end
      
      def approve_map(map)
        out = "";
        map.keys.sort { |a,b| a.to_s <=> b.to_s }.each do |key|
          out += "[#{key}] = #{map[key]} \r"
        end
        approve(out)
      end
      
      def approve(data)
        approve_with_writer(TextWriter.new(data))
      end
      
      def approve_html(data)
        approve_with_writer(HtmlWriter.new(data))
      end
      
      def approve_xml(data)
        approve_with_writer(TextWriter.new(XmlWriter.pretty_xml(data)))
      end
      
      def approve_with_writer(writer)
          approver = FileApprover.new(writer, @namer)
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
      
      def namer=(namer)
        @namer = namer
      end
      
      def namer
        @namer
      end
    
      def get_default_reporter()
        @reporters ||= []
        unless @reporters.empty?
          if @single_use
            @single_use = false
            return @reporters.pop
          end
          return @reporters.last
        end
        if defined? Spec::Mate
          TextMateReporter.instance
        else
          QuietReporter.instance
        end
      end

      def reporter(reporter)
        prepare_reporters
        @reporters.push(reporter);
      end

      def prepare_reporters
        @reporters ||= []
        @reporters.pop if @single_use
        @single_use = false
      end

      def single_use_reporter(reporter)
        prepare_reporters
        @reporters.push(reporter);
        @single_use = true
      end

      def unregister_reporter(reporter)
        @reporters.remove(reporter);
      end

      def unregister_last_reporter()
        @reporters.pop() if @reporters
      end
    end
  end
end

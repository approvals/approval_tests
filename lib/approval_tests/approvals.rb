require 'fileutils'
__DIR__ = File.dirname(__FILE__)
require "#{__DIR__}/namers/rspec_namer"
require "#{__DIR__}/namers/cucumber_namer"
require "#{__DIR__}/approvers/file_approver"
require "#{__DIR__}/writers/text_writer"
require "#{__DIR__}/writers/html_writer"
require "#{__DIR__}/writers/xml_writer"
require "#{__DIR__}/reporters/quiet_reporter"
require "#{__DIR__}/reporters/text_mate_reporter"
require "#{__DIR__}/reporters/diff_reporter"
require "#{__DIR__}/reporters/vim_diff_reporter"
require "#{__DIR__}/reporters/file_launcher_reporter"

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
        
        i = -1;
        format = list.map do |m| 
          i = i+1
          "#{label}[#{i}] = #{m} \r"
        end
        format = "#{label}.count = 0" if list.empty?
        approve(format.to_s)
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
        return @reporters.first() unless @reporters.empty?
        if defined? Spec::Mate
          TextMateReporter.instance
        else
          QuietReporter.instance
        end
      end

      def reporter(reporter)
        @reporters ||= []
        @reporters.push(reporter);
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

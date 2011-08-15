

module ApprovalTests
  module Approvers
    class FileApprover
      def initialize(writer, namer)
  			@writer = writer
  			@namer = namer
  		end
  		
      def approve
  			basename = "#{@namer.source_file_path}/#{@namer.approval_name}"
  			@approved = @writer.get_approval_filename(basename)
  			@received = @writer.get_received_filename(basename)
  			@received = @writer.write_received_file(@received)

  			unless File.exists?(@approved)
  			  @failure = ApprovalError.new("Failed Approval: Approval File \"#{@approved}\" Not Found.")
  			  @failure.received_filename = @received
  			  @failure.approved_filename = @approved
  				return false
  			end

  			unless FileUtils.cmp(@received, @approved)
  			  @failure = ApprovalError.new("Failed Approval: Received file #{@received} does not match approved file #{@approved}.")
  			  @failure.received_filename = @received
  			  @failure.approved_filename = @approved
  				return false
  			end

  			return true
  		end
  		
      def fail
        raise @failure
      end
      		
      def report_failure(reporter)
        reporter.report(@approved, @received);
      end
      		
      def clean_up_after_success
        File.delete(@received)
      end
    end
  end
end
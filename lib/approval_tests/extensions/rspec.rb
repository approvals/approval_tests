module ApprovalTests
  module Extensions
    module RSpec
      def approve(thing=nil, options={}, backtrace=nil, &implementation)
        if block_given?

          approve_description = "#{thing}" 
        else
          approve_description = nil
          result = thing
        end

        example(approve_description, options) do
          if block_given?    
            result = yield implementation
          end
          Approvals.approve(result)
        end
      end
      
      def approve_html(thing=nil, options={}, backtrace=nil, &implementation)
        if block_given?
          approve_description = "#{thing}" 
        else
          approve_description = nil
          result = thing
        end

        example(approve_description, options) do
          if block_given?    
            result = yield implementation
          end
          Approvals.approve(result, :html)
        end
      end
    end
  end
end

begin
  RSpec.configure do |config|  
    config.before(:each) do
      Approvals.namer = RSpecNamer.new()
      Approvals.namer.approval_name = "self.example_group.full_description".gsub("/", "__FORWARD_SLASH__");
      Approvals.namer.source_file_path = File.dirname(self.class.metadata[:example_group].location)
    end
    config.extend(ApprovalTests::Extensions::RSpec)
  end
rescue LoadError 
end
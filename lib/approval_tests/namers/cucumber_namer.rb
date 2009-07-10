module ApprovalTests
  module Namers
    class CucumberNamer
      attr_reader :approval_name
      attr_writer :source_file_path

      def approval_name
        "basic_approval.approves_string"
      end
      
      def approval_name=(name)
        @approval_name = name.downcase.gsub(/ |\./, "_")
      end
      
      def source_file_path
        #@source_file_path ||= File.dirname(File.expand_path(@approval_name))
        @source_file_path = "features"
      end
    end
  end
end

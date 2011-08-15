module ApprovalTests
  module Namers
    class RSpecNamer
      attr_reader :approval_name
      attr_writer :source_file_path
      
      def approval_name=(name)
        @approval_name = name.downcase.gsub(/ |\./, "_")
      end
      
      def source_file_path
        @source_file_path ||= File.dirname(File.expand_path(@approval_name))
      end
      
    end
  end
end
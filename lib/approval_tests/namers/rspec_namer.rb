module ApprovalTests
  module Namers
    class RSpecNamer
      
      def approval_name
        @approval_name
      end
      
      def approval_name=(name)
        @approval_name = name.downcase.gsub(/ |\./, "_")
      end
      
      def source_file_path
        @source_file_path ||= File.dirname(File.expand_path(@approval_name))
      end
      
      def source_file_path=(path)
        @source_file_path = path
      end
    end
  end
end
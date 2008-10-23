require 'singleton'

module ApprovalTests
  module Reporters
    class TextMateReporter
      include Singleton

  		def report(approved, received)
        puts "<script language='JavaScript'>
              function move(received, approved) {
                TextMate.system('mv ' + received + ' ' + approved, null).outputString;
              }
              </script>"    
        puts "<a href='#' onclick='move(\"#{File.expand_path(received)}\",\"#{File.expand_path(approved)}\")'>Approve</a>"
        puts "<a href='txmt://open?url=file://#{File.expand_path(received)}'>View</a>"
      end
      
      def approved_when_reported()
        false 
      end
    end
  end
end
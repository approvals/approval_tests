require 'singleton'

module ApprovalTests
  module Reporters
    class TextMateReporter
      include Singleton

  		def report(approved, received)
        puts "<script language='JavaScript'>
              function move(received, approved) {
                return TextMate.system('mv ' + received + ' ' + approved, null).outputString;
              }
              </script>"    
        puts "<a href='#' onclick='move(\"#{File.expand_path(received)}\",\"#{File.expand_path(approved)}\")'>Approve</a>"
        puts "<a href='txmt://open?url=file://#{File.expand_path(received)}'>View</a>"
        puts "<p></p><iframe src='tm-file://#{File.expand_path(received)}' width='100%' frameborder='0' style='border:solid 1px red'></iframe>"
      end
      
      def approved_when_reported()
        false 
      end
    end
  end
end
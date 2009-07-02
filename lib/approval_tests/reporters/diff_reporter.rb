require 'singleton'

module ApprovalTests
  module Reporters
    class DiffReporter
      include Singleton

  		def report(approved, received)
  		   TextWriter.write_file(approved,"")  unless File.exists?(approved)
        exec "/Applications/DiffMerge.app/Contents/MacOS/DiffMerge --nosplash \"#{received}\" \"#{approved}\""
      end
      
      def approved_when_reported()
        false 
      end
    end
  end
end
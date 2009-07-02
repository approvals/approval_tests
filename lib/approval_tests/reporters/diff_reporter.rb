require 'singleton'

module ApprovalTests
  module Reporters
    class DiffReporter
      include Singleton

  		def report(approved, received)
        exec "/Applications/DiffMerge.app/Contents/MacOS/DiffMerge --nosplash \"#{received}\" \"#{approved}\""
      end
      
      def approved_when_reported()
        false 
      end
    end
  end
end
require 'singleton'

module ApprovalTests
  module Reporters
    class QuietReporter
      include Singleton

  		def report(approved, received)
        if RUBY_PLATFORM =~ /mswin32/
  		    puts "move /Y \"#{received}\" \"#{approved}\""
  			else
  			  puts "mv \"#{received}\" \"#{approved}\""
			  end
      end
      
      def approved_when_reported()
        false 
      end
    end
  end
end
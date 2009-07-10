require 'singleton'

module ApprovalTests
  module Reporters
    class DiffReporter
      def initialize(&block)
        @launcher = block || self.class.default_launcher
      end

  		def report(approved, received)
        TextWriter.write_file(approved,"")  unless File.exists?(approved)
        QuietReporter.instance.report(approved, received)
        launch(approved, received)
      end
      
      def approved_when_reported()
        false 
      end

      protected

      def launch(approved, received)
        exec @launcher.call(approved, received)
      end

      def self.default_launcher
        lambda { |app, rec|
          "/Applications/DiffMerge.app/Contents/MacOS/DiffMerge --nosplash \"#{rec}\" \"#{app}\""
        }
      end

    end
  end
end

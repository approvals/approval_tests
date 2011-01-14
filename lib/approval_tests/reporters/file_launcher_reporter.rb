
require 'singleton'

module ApprovalTests
  module Reporters
    class FileLauncherReporter < DiffReporter
      def self.default_launcher
        lambda { |app, rec|
          "open #{rec}"
        }
      end
    end
  end
end

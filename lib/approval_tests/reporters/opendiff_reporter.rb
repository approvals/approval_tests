require 'singleton'

module ApprovalTests
  module Reporters
    class OpendiffReporter < DiffReporter
      def self.default_launcher
        lambda { |app, rec|
          system("opendiff #{rec} #{app}")
        }
      end
    end
  end
end

require 'singleton'

module ApprovalTests
  module Reporters
    class TortoisediffReporter < DiffReporter
      def self.default_launcher
        lambda { |app, rec|
          system("C:\\Program Files\\TortoiseSVN\\bin\\TortoiseMerge.exe #{rec} #{app}")
        }
      end
    end
  end
end

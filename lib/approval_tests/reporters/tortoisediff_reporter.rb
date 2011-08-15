require 'singleton'

module ApprovalTests
  module Reporters
    class TortoisediffReporter < DiffReporter
      TORTOISE_BIN = 'C:\\Program Files\\TortoiseSVN\\bin\\TortoiseMerge.exe'
      
      def self.default_launcher
        lambda { |app, rec|
          system("#{TORTOISE_BIN} #{rec} #{app}")
        }
      end
    end
  end
end

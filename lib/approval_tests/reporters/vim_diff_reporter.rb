require 'singleton'

module ApprovalTests
  module Reporters
    class VimDiffReporter < DiffReporter
      def self.default_launcher
        lambda { |app, rec|
          "echo '#!/bin/sh' > /tmp/reporter.command; echo 'vimdiff #{rec} #{app}' > /tmp/reporter.command; chmod +x /tmp/reporter.command; open /tmp/reporter.command"
        }
      end
    end
  end
end

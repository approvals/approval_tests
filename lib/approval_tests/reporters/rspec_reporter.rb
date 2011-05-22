require 'singleton'

module ApprovalTests
  module Reporters
    class RspecReporter
      include Singleton

      def report(app, rec)
        approved = ""
        approved = File.read(app) if File.exists?(app)
        received = File.read(rec)
        received.should == approved
      end
    end
  end
end


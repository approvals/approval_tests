module ApprovalTests
  module Namers
    class CucumberNamer
      attr_reader :approval_name
      attr_reader :source_file_path

      def self.create_namer(scenario)
        feature_file_and_path = scenario.instance_variable_get(:@feature).file
        scenario_name = scenario.name

        Approvals.namer = CucumberNamer.new(feature_file_and_path, scenario_name)
      end

      def initialize(feature_file_and_path, scenario_name)
        feature_file_and_path =~ /([^\/]*)\.feature$/
        feature_name = $1
        
        @source_file_path = File.dirname(File.expand_path(feature_file_and_path))
        
        @approval_name = format("#{feature_name}_#{scenario_name}")
      end

      def format(string)
        string.downcase.gsub(/ |\./, "_")
      end

    end
  end
end

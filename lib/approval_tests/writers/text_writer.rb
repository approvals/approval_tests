module ApprovalTests
  module Writers
    class TextWriter
      def initialize(data)
        @data = data
      end
      
      def get_approval_filename(basename)
        basename + ".approved.txt"
      end
      
      def get_received_filename(basename)
        basename + ".received.txt"
      end
      
      def write_received_file(received)
        TextWriter.write_file(received, @data)
      end
      def self.write_file(name, data)
        f = File.new("#{name}", "w+")
        f.write(data)
        f.close()
        f.path
      end
    end
  end
end
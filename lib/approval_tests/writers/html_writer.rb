module ApprovalTests
  module Writers
    class HtmlWriter
      def initialize(data)
        @data = data
      end
      
      def get_approval_filename(basename)
        basename + ".approved.html"
      end
      
      def get_received_filename(basename)
        basename + ".received.html"
      end
      
      def write_received_file(received)
        f = File.new("#{received}", "w+")
        f.write(@data)
        f.close()
        f.path
      end
    end
  end
end
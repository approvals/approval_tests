require 'fileutils'

module ApprovalTests
  module Approvals
    def self.included(base)
      @@description = base.instance_variable_get("@description_text")
    end
    
    def are_files_same(received_file_name, approved_file_name)
      return false unless File.exists?(approved_file_name)
      FileUtils.cmp(approved_file_name, received_file_name)
    end

    def approve_text(text)
      approve_file_name = "#{spec_name}.approved.txt"
      approval_file_exist = File.exists?(approve_file_name)
      receive_file_name = create_receive_file(text)
      same = are_files_same(receive_file_name, approve_file_name)
      unless same
        add_approval_link(spec_name, receive_file_name, approve_file_name)  
        add_viewing_link(approve_file_name, "Approved")
        add_viewing_link(receive_file_name, "Received")
      end
      
      violated("#{approve_file_name} has never been approved.") unless approval_file_exist
      if same
        File.delete(receive_file_name)
      end
      
      same.should == true
    end    
        
    def get_bytes(file)
      puts file.methods
      bytes = []
      file.each_byte {|b| bytes << b}
      return bytes
    end
    
    def spec_name()
      "#{@@description}.#{instance_variable_get("@_defined_description")}".downcase.gsub(/ |\./, "_")
    end
    
    def add_approval_link(spec_name, received, approved)
      puts "<script language='JavaScript'>
            function move(received, approved) {
              TextMate.system('mv ' + received + ' ' + approved, null).outputString;
            }
            </script>"    
      puts "<a href='#' onclick='move(\"#{File.expand_path(received)}\",\"#{File.expand_path(approved)}\")'>Approve #{spec_name}</a>"
    end
    
    def add_viewing_link(file, label)
      puts "<br/><a href='txmt://open?url=file://#{File.expand_path(file)}'>View #{label}</a>" if File.exists?(file)
    end

    def create_receive_file(text)
      f = File.new("#{spec_name}.receive.txt", "w+")
      f.write(text)
      f.close()
      f.path
    end

  end
end
module ApprovalTests
  module Utils
    def self.program_exists(name)
      system("which #{name}")
    end
  end
end

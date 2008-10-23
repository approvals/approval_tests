class CleanupReporter
  def report(approved, received)
		File.delete(received)
	end
	
	def approved_when_reported()
		false
  end
end
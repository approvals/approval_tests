Given /^a string "([^\"]*)"$/ do |str|
  @string = str
end

When /^I approve the string$/ do
end

Then /^the string is approved$/ do
  Approvals.reporter ApprovalTests::Reporters::DiffReporter.new { |app, rec| %|vimdiff "#{rec}" "#{app}"| } 
  # OpenStruct.new(:source_file_path => 'features', :approval_name => 'basic_approval.approves_string')
  Approvals.namer = CucumberNamer.new
  Approvals.approve(@string)
end



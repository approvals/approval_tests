Given /^a string "([^\"]*)"$/ do |str|
  @string = str
end

Then /^verify the string$/ do
  Approvals.reporter(Reporters::OpendiffReporter.new)
  Approvals.approve(@string)
end

Then /^the approval name is "([^"]*)"$/ do |name|
  Approvals.namer.approval_name.should == name
end

Then /^the path contains "([^"]*)"$/ do |file|
  feature_file_with_path = Approvals.namer.source_file_path + "/" + file
  File.exists?(feature_file_with_path).should be_true
end

Before do |scenario|
  CucumberNamer.create_namer(scenario)
end

World do
  include ApprovalTests
end

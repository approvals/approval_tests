# -*- encoding: utf-8 -*-
 
Gem::Specification.new do |s|
  s.name = %q{approval_tests}
  s.version = "0.0.2"
 
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dan Gilkerson"]
  s.date = %q{2009-01-31}
  s.description = %q{Approval testing library}
  s.email = %q{contact@dangilkerson.com}
  s.files = ["lib/approval_tests/approvals.rb", "lib/approval_tests/approvers/file_approver.rb", "lib/approval_tests/extensions/rspec.rb", "lib/approval_tests/namers/rspec_namer.rb", "lib/approval_tests/reporters/quiet_reporter.rb", "lib/approval_tests/reporters/text_mate_reporter.rb", "lib/approval_tests/writers/html_writer.rb", "lib/approval_tests/writers/text_writer.rb", "lib/approval_tests.rb", "spec/approvals_multiple_describes_should_approve_multiple_describes.approved.txt", "spec/approvals_should_approve_shared_behaviors.approved.txt", "spec/approvals_should_successfully_approve_text.approved.txt", "spec/approvals_spec.rb", "spec/approvals_using_approval_blocks.received.txt", "spec/approvals_using_approval_blocks_.approved.txt", "spec/approvals_using_approval_blocks_the_last_statement.approved.txt", "spec/cleanup_reporter.rb", "spec/spec.opts", "spec/spec_helper.rb", "lib", "Rakefile", "README", "spec"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/approvaltests/approval_tests}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.2}
  s.summary = %q{Approval testing library}
 
  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3
 
    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

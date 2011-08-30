# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{approval_tests}
  s.version = "0.0.8"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dan Gilkerson, Llewellyn Falco"]
  s.date = %q{2009-07-03}
  s.description = %q{Approval testing library for ruby}
  s.email = %q{approvaltests@dangilkerson.com}
  s.extra_rdoc_files = [
    "README"
  ]
  s.files = [
    "README",
     "Rakefile",
     "VERSION",
     "approval_tests.gemspec",
     "lib/approval_tests.rb",
     "lib/approval_tests/approvals.rb",
     "lib/approval_tests/approvers/file_approver.rb",
     "lib/approval_tests/extensions/rspec.rb",
     "lib/approval_tests/namers/rspec_namer.rb",
     "lib/approval_tests/namers/cucumber_namer.rb",
     "lib/approval_tests/reporters/diff_reporter.rb",
     "lib/approval_tests/reporters/vimdiff_reporter.rb",
     "lib/approval_tests/reporters/quiet_reporter.rb",
     "lib/approval_tests/reporters/text_mate_reporter.rb",
     "lib/approval_tests/reporters/file_launcher_reporter.rb",
     "lib/approval_tests/writers/html_writer.rb",
     "lib/approval_tests/writers/text_writer.rb",
     "lib/approval_tests/writers/xml_writer.rb",
     "lib/approval_tests/utils.rb",
     "spec/a.txt",
     "spec/approvals_lists_should_show_empty_lists.approved.txt",
     "spec/approvals_lists_should_write_arrays.approved.txt",
     "spec/approvals_lists_should_write_maps.approved.txt",
     "spec/approvals_multiple_describes_should_approve_multiple_describes.approved.txt",
     "spec/approvals_should_approve_shared_behaviors.approved.txt",
     "spec/approvals_should_successfully_approve_text.approved.txt",
     "spec/approvals_spec.rb",
     "spec/approvals_using_approval_blocks.approved.txt",
     "spec/approvals_using_approval_blocks_the_last_statement.approved.txt",
     "spec/approvals_xml_should_be_pretty.approved.txt",
     "spec/b.txt",
     "spec/cleanup_reporter.rb",
     "spec/spec.opts",
     "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/approvals/approval_tests}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{approvaltests}
  s.rubygems_version = %q{1.3.4}
  s.summary = %q{Approval testing library}
  s.test_files = [
    "spec/approvals_spec.rb",
     "spec/cleanup_reporter.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

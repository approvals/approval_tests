# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name = %q{approval_tests}
  s.version = "0.0.9"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.rubygems_version = %q{1.3.4}
  s.authors = ["Dan Gilkerson, Llewellyn Falco"]
  s.date = %q{2009-07-03}
  s.description = %q{Approval testing library for ruby}
  s.email = %q{approvaltests@dangilkerson.com}
  s.extra_rdoc_files = ["README"]
  s.homepage = %q{http://github.com/approvals/approval_tests}
  s.rdoc_options = ["--charset=UTF-8"]
  s.rubyforge_project = %q{approvaltests}
  s.summary = %q{Approval testing library}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {spec}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3
  end
end

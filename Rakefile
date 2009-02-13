require 'rubygems'
require 'spec/rake/spectask'
require 'rake/gempackagetask'

spec = Gem::Specification.new do |s|
  s.name = "approval_tests"
  s.version = "0.0.2"
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dan Gilkerson"]
  s.date = %q{2009-01-31}
  s.description = %q{Approval testing library}
  s.email = %q{contact@dangilkerson.com}
  s.files = FileList['lib/**/*.rb', 'spec/**', '*'].to_a  
  s.has_rdoc = true
  s.homepage = %q{http://github.com/approvaltests/approval_tests}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.0}
  s.summary = %q{Approval testing library}
end

Rake::GemPackageTask.new(spec) do |pkg|
end

desc("Package gem and install")
task :install => [:clobber, :package] do
  sh "sudo gem install pkg/#{spec.name}-#{spec.version}.gem"
end

Spec::Rake::SpecTask.new('specs') do |t|
  t.spec_opts = ["--format", "specdoc", "--colour"]
  t.spec_files = Dir['spec/**/*_spec.rb'].sort
end
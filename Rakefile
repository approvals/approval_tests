require 'rubygems'
require 'spec/rake/spectask'

Spec::Rake::SpecTask.new('specs') do |t|
  t.spec_opts = ["--format", "specdoc", "--colour"]
  t.spec_files = Dir['spec/**/*_spec.rb'].sort
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "approval_tests"
    gemspec.summary = "Approval testing library"
    gemspec.email = "approvaltests@dangilkerson.com"
    gemspec.homepage = "http://github.com/approvaltests/approval_tests"
    gemspec.description = "Approval testing library"
    gemspec.authors = ["Dan Gilkerson, Llewellyn Falco"]
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end
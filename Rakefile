require 'rubygems'
require 'rspec/core/rake_task'
require 'cucumber/rake/task'

task :default => ["specs", "features"]

RSpec::Core::RakeTask.new('specs') do |t|
  t.rspec_opts = ["--format", "documentation", "--colour"]
end

Cucumber::Rake::Task.new('features')

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "approval_tests"
    gemspec.summary = "Approval testing library"
    gemspec.email = "approvaltests@dangilkerson.com"
    gemspec.homepage = "http://github.com/approvaltests/approval_tests"
    gemspec.description = "Approval testing library for ruby"
    gemspec.authors = ["Dan Gilkerson, Llewellyn Falco"]
    gemspec.rubyforge_project = 'approvaltests'
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end
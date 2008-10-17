require 'rubygems'

require 'rake'
require 'rake/rdoctask'
require 'spec/rake/spectask'
require "rake/gempackagetask"
require "rake/clean"

desc "Run all specs"
Spec::Rake::SpecTask.new('specs') do |t|
  t.spec_opts = ["--format", "specdoc", "--colour"]
  t.spec_files = Dir['spec/**/*_spec.rb'].sort
end

##############################################################################
# Package && release
##############################################################################
RUBY_FORGE_PROJECT = "approvals"
PROJECT_URL = ""
PROJECT_SUMMARY = "Approval Testing"
PROJECT_DESCRIPTION = PROJECT_SUMMARY
 
AUTHOR = "Dan Gilkerson and isidore_us"
EMAIL = "contact@dangilkerson.com"
 
GEM_NAME = "approvals"
PKG_BUILD = ENV['PKG_BUILD'] ? '.' + ENV['PKG_BUILD'] : ''
GEM_VERSION = "0.0.1"
 
RELEASE_NAME = "REL #{GEM_VERSION}"
  
spec = Gem::Specification.new do |s|
  s.name = GEM_NAME
  s.version = GEM_VERSION
  s.platform = Gem::Platform::RUBY
  s.author = AUTHOR
  s.email = EMAIL
  s.homepage = PROJECT_URL
  s.summary = PROJECT_SUMMARY
  s.description = PROJECT_DESCRIPTION
  s.require_path = "lib"
  s.files = Dir["lib/**/*"]
 
  # rdoc
  s.add_dependency "rspec"
end
 
Rake::GemPackageTask.new(spec) do |package|
  package.gem_spec = spec
end
 
desc "Run :package and install the resulting .gem"
task :install => :clean do
  RakeHelper.install(GEM_NAME, :version => GEM_VERSION)
end
 
desc "Install Merb with development dependencies"
task :dev_install => :clean do
  RakeHelper.install(GEM_NAME, :version => GEM_VERSION, :development => true)
end
 
desc "Run :clean and uninstall the .gem"
task :uninstall => :clean do
  RakeHelper.uninstall(GEM_NAME, :version => GEM_VERSION)
end
 
desc "Create a gemspec file"
task :gemspec do
  File.open("#{GEM_NAME}.gemspec", "w") do |file|
    file.puts spec.to_ruby
  end
end
 
CLEAN.include ["pkg"]
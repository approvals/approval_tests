require 'rubygems'
require 'spec'

__DIR__ = File.join(File.dirname(__FILE__))
$LOAD_PATH.unshift __DIR__ unless
  $LOAD_PATH.include?(__DIR__) ||
  $LOAD_PATH.include?(File.expand_path(__DIR__))

require 'cleanup_reporter'

__DIR__ = File.join(__DIR__,  "..", "lib")
 
$LOAD_PATH.unshift __DIR__ unless
  $LOAD_PATH.include?(__DIR__) ||
  $LOAD_PATH.include?(File.expand_path(__DIR__))

require 'approval_tests'
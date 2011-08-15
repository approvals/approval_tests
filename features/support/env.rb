require 'cucumber/formatter/unicode'

__DIR__ = File.join(File.dirname(__FILE__) + '/../../lib')
$LOAD_PATH.unshift __DIR__ unless
  $LOAD_PATH.include?(__DIR__) ||
  $LOAD_PATH.include?(File.expand_path(__DIR__))

require 'approval_tests'
require 'approval_tests/extensions/cucumber'

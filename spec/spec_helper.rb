require 'rubygems'
require 'rspec'
 
$:.unshift(File.dirname(__FILE__) + '/../lib')
$:.unshift(File.dirname(__FILE__))  

require 'approval_tests'

include ApprovalTests
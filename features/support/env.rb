require File.join(File.dirname(__FILE__) + '/../../spec/spec_helper')

World do
  include ApprovalTests
end

require 'cucumber/formatter/unicode'
require 'spec/expectations'

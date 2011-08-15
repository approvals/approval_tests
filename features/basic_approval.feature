Feature: Basic Approval
  As a testing person 
  I want to be able to use the basics of Approvals

  Scenario: Approves String
    Given a string "Hello World"
    Then verify the string
  
  Scenario: Approval names
    Then the approval name is "basic_approval_approval_names"

  Scenario: Understand paths
    Then the path contains "basic_approval.feature"

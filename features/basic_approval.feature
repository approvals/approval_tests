Feature: Basic Approval
  As a testing persion I want to be able to use the basics of Approvals

  Scenario: Approves String
    Given a string "Hello World"
    When I approve the string
    Then the string is approved

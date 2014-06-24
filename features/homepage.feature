Feature: test

  Scenario: content
    Given I am on the homepage
    When I wait for angular
    Then I should see content

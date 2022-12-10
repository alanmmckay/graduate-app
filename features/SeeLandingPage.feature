Feature: see user landing page
  As a user
  I would like to see a landing page so that I know I've accessed the page.

  Background: users have logged in

    Given the following users have accounts:
      | email         | password | first_name | last_name |
      | alan@test.com | test123  | Alan       |  Smith    |
    Then 1 users should exist
    When I am on the home page
    And I have logged in with "alan@test.com" and "test123"

Scenario: see landing page
  Then I should see "landing page"
  And I should see "User information"

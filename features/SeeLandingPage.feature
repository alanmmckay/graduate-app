Feature: see landing page
  As a user
  I would like to see a landing page so that I know I've accessed the page.

Background:
  Given the following users have accounts:
    | email                   | password           | first_name       | last_name        |
    | fred@example.com        | test123            | fred        | smith        |
  Then 1 users should exist
  Given I am on the home page
  When I input "fred@example.com" for "Email"
  And I input "test123" for "Password"
  And I click "Login"

Scenario: see landing page
  Then I should see "landing page"
  And I should see "User information"
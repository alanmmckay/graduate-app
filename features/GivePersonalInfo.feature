Feature: Give personal information to apply to a department
  As a prospective student
  So that I can apply to a department / program
  I would like to provide personal details to inform reviewers' decisions

  Background: users have logged in

    Given the following users have accounts:
      | email         | password | first_name | last_name |
      | alan@test.com | test123  | Alan       |  Smith    |
    Then 1 users should exist
    When I am on the home page
    And I have logged in with "alan@test.com" and "test123"
    And I click "Begin Application"
    And I click "Continue"

# Happy paths
  Scenario: Give personal information
    And I input "UofI" for "Institution Name"
    And I input "Iowa City" for "Institution City"
    And I input "BME" for "Area of Study"
    And I input "Bachelors" for "Degree Earned"
    And I input "3.0" for "GPA"
    And I click "Add Degree"
    Then I should see "successfully added"

# Sad paths
  Scenario: leave a field blank
    And I input "UofI" for "Institution Name"
    And I input "Iowa City" for "Institution City"
    And I input "BME" for "Area of Study"
    And I input "Bachelors" for "Degree Earned"
    And I click "Add Degree"
    Then I should see "Must be filled"
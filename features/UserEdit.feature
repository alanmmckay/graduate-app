Feature: UserEdit
  As a new user of this website
  So that I can confirm my personal information
  I would like to update this information

Background: users have logged in

  Given the following users have accounts:
    | email         | password | first_name | last_name |
    | alan@test.com | test123  | Alan       |  Smith    |
  Then 1 users should exist
  When I am on the home page
  And I have logged in with "alan@test.com" and "test123"
  Then I should see "User information"
  When I click "Edit User Information"
  Then I should see "Update the following"
  And I should not see "Address"

# Happy Paths
Scenario: edit first name
  When I input "Bob" for "First Name"
  And I click "Update"
  Then I should see "Bob Smith"

Scenario: edit last name
  When I input "Jones" for "Last Name"
  And I click "Update"
  Then I should see "Alan Jones"

Scenario: edit phone number
  When I input "555-555-5555" for "Phone"
  And I click "Update"
  Then I should see "555-555-5555"

Scenario: cancel edit
  When I click "Cancel"
  Then I should see "User Information"
  And I should see "Alan Smith"

# Sad Paths
Scenario: no first name
  When I input "" for "First Name"
  And I click "Update"
  Then I should see "Name must be filled"

Scenario: no last name
  When I input "" for "Last Name"
  And I click "Update"
  Then I should see "Name must be filled"

Scenario: invalid characters for name
  When I input "Alan$" for "First Name"
  And I click "Update"
  Then I should see "Invalid name given"

Scenario: invalid phone number given
  When I input "192.168.1.1" for "phone"
  And I click "Update"
  Then I should see "Invalid phone given"
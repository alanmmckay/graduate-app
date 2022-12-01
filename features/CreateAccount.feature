Feature: create a new account
  As a new user
  So that I can access my account between sessions
  I would like to create an account

Background:

  Given the following users have accounts:
    | email                        | password           | first_name       | last_name |
    | fred.uiowaSELT@example.com   | password1234       | Fred             | Smith     |
    | sally.uiowaSELT@example.com  | sally4321          | Sally            | Jones     |

  And I am on the home page
  Then 2 users should exist

# Happy paths
Scenario: new valid user
  When I click "Register"
  And I input "frank123@example.com" for "Email"
  And I input "password123" for "Password"
  And I input "password123" for "Verify Password"
  And I input "Frank" for "First Name"
  And I input "Stevens" for "Last Name"
  And I click "Create Account"
  Then I should see "Account has been created. Please sign in"

Scenario: cancel
  When I click "Register"
  Then I should see "Go Back"
  When I click "Go Back"
  Then I should see "Coming Soon"
  
# Sad paths
Scenario: account already exists
  When I click "Register"
  And I input "fred.uiowaSELT@example.com" for "Email"
  And I input "password123" for "Password"
  And I input "password123" for "Verify Password"
  And I input "Fred" for "First Name"
  And I input "Smith" for "Last Name"
  And I click "Create Account"
  Then I should see "Email already in use"
  And I should not see "Account has been created. Please sign in"

Scenario: no password input
  When I click "Register"
  And I input "frank123@example.com" for "Email"
  And I input "Frank" for "First Name"
  And I input "Stevens" for "Last Name"
  And I click "Create Account"
  Then I should see "Password must be filled"
  And I should not see "Account has been created. Please sign in"

Scenario: passwords don't match
  When I click "Register"
  And I input "frank123@example.com" for "Email"
  And I input "password123" for "Password"
  And I input "different_password" for "Verify Password"
  And I input "Frank" for "First Name"
  And I input "Stevens" for "Last Name"
  And I click "Create Account"
  Then I should see "Passwords do not match"
  And I should not see "Account has been created. Please sign in"

Scenario: email not supplied
  When I click "Register"
  And I input "FakePassword" for "Password"
  And I input "FakePassword" for "Verify Password"
  And I click "Create Account"
  Then I should see "Invalid email given"
  And I should not see "Account has been created. Please sign in"

Scenario: email case sensitivity
  When I click "Register"
  And I input "FRED.uiowaSELT@example.com" for "Email"
  And I input "password123" for "Password"
  And I input "password123" for "Verify Password"
  And I input "Fred" for "First Name"
  And I input "Smith" for "Last Name"
  And I click "Create Account"
  Then I should see "Email already in use"
  And I should not see "Account has been created. Please sign in"

Scenario: password case sensitivity
  When I click "Register"
  And I input "fred.uiowaSELT@example.com" for "Email"
  And I input "password123" for "Password"
  And I input "PASSWORD123" for "Verify Password"
  And I input "Fred" for "First Name"
  And I input "Smith" for "Last Name"
  And I click "Create Account"
  Then I should see "Passwords do not match"
  And I should not see "Account has been created. Please sign in"
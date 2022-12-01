Feature: login
  As a user
  So that I can access my account between sessions
  I would like to be able to log in to my account

Background: users have created accounts

  Given the following users have accounts:
    | email                        | password           | first_name       | last_name |
    | fred.uiowaSELT@example.com   | password1234       | Fred             | Smith     |
    | sally.uiowaSELT@example.com  | sally4321          | Sally            | Jones     |

  And I am on the home page
  Then I should see "Landing Page for Graduate Application"

# Happy paths
Scenario: login with valid account
  When I input "fred.uiowaSELT@example.com" for "Email"
  And I input "password1234" for "Password"
  And I click "Login"
  Then I should see "User information"

# Sad paths
Scenario: login without an account
  When I input "james.uiowaSELT@example.com" for "Email"
  And I input "password1234" for "Password"
  And I click "Login"
  Then I should see "Invalid Credentials"


Scenario: login without a password
  When I input "fred.uiowaSELT@example.com" for "Email"
  And I click "Login"
  Then I should see "Invalid Credentials"

Scenario: login without an email
  And I input "password1234" for "Password"
  And I click "Login"
  Then I should see "Invalid Credentials"
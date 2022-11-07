Feature: login
  As a user
  So that I can access my account between sessions
  I would like to be able to log in to my account

Background: users have created accounts

  Given the following users have accounts:
  | username                   | password           | type       |
  | fred                       | password1234       | applicant  |
  | sally                      | sally4321          | faculty    |

  And I am on the home page

# Happy path
Scenario: login with account already created
  When I click "Login"
  And I input my username "fred" and password "password1234"
  And I click "Login"
  Then I should be logged in

# Sad path
Scenario: login without an account
  When I click "Login"
  And I input my username "missing username" and password "missing password"
  And I click "Login"
  Then I should see an error message that says "No account with that username and/or password"
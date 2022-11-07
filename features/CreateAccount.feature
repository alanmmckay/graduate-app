Feature: create a new account
  As a new user
  So that I can access my account between sessions
  I would like to create an account

Background:

  Given the following users have accounts:
    | username                   | password           | type       |
    | fred                       | password1234       | student    |
    | sally                      | sally4321          | faculty    |

  And I am on the home page

# Happy paths
Scenario: new applicant user
  When I click "Create Account"
  And I input my username "frank" and password "cat1dog2"
  And I select "student" from the "Account type" dropdown
  And I click "Create Account"
  Then I should see a message that says "student account created with username frank"

Scenario: new faculty user
  When I click "Create Account"
  And I input my username "pat" and password "pat1pog2"
  And I select "faculty" from the "Account type" dropdown
  And I click "Create Account"
  Then I should see a message that says "faculty account created with username pat"

# Sad paths
Scenario: account already exists
  When I click "Create Account"
  And I input my username "fred" and password "flinstone5"
  And I select "student" from the "Account type" dropdown
  And I click "Create Account"
  Then I should see an error message that says "Account with username fred already exists"

Scenario: no password input
  When I click "Create Account"
  And I input my username "phil"
  And I select "student" from the "Account type" dropdown
  And I click "Create Account"
  Then I should see an error message that says "No password given. Please input a password to create an account"
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
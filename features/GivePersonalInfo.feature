Feature: Give personal information to apply to a department
  As a prospective student
  So that I can apply to a department / program
  I would like to provide personal details to inform reviewers' decisions

  Background:

    Given the following users have accounts:
      | username                   | password           | type       |
      | fred.uiowaSELT@gmail.com   | password1234       | student    |
      | sally.uiowaSELT@gmail.com  | sally4321          | faculty    |

    And I am on the account page

# Happy paths
  Scenario: Give personal information
    When I login with username "fred" and password "password1234"
    And I click "Add Info"
    And I enter "3.8" into "GPA"
    Then I should have "3.8" in "GPA" on my account

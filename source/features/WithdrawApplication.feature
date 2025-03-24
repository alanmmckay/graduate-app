Feature: Withdraw Application
  As a prospective student who has already applied
  So that I can withdraw my application
  I would like to be able to cancel my application submission

  Background:

    Given the following users have accounts:
      | username                   | password           | type       |
      | fred.uiowaSELT@gmail.com   | password1234       | student    |
      | ted.uiowaSELT@gmail.com    | password5678       | student    |
      | bread.uiowaSELT@gmail.com  | password9101       | student    |
      | sally.uiowaSELT@gmail.com  | sally4321          | faculty    |

    And the following applications have been submitted:
      | student                   | department         | gpa   |
      | fred                      | CSE                | 4.0   |
      | ted                       | CSE                | 2.0   |
      | bread                     | CSE                | 3.5   |

# Happy paths
  Scenario: withdraw application
    When I login with username "fred" and password "password1234"
    And I click "Withdraw Application"
    Then "fred"'s application should be rejected

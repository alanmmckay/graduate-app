Feature: approve faculty accounts
  As a department head
  So that I can admit applicants
  I want to accept or reject an applicant

  Background:

    Given the following users have accounts:
      | username                   | password           | type       |
      | megan.uiowaSELT@gmail.com  | password1234       | head       |

    And the following faculty have been authorized:
      | username                   | department         | is_head?   |
      | megan.uiowaSELT@gmail.com  | CSE                | yes        |

    And the following student accounts have been created:
      | username                   | department         |
      | bill.uiowaSELT@gmail.com   | CSE                |
      | brandy.uiowaSELT@gmail.com | CSE                |
      | bob.uiowaSELT@gmail.com    | CSE                |

    And the following applications have been submitted:
      | student                   | department         | gpa   |
      | bill                      | CSE                | 4.0   |
      | brandy                    | CSE                | 2.0   |
      | bob                       | CSE                | 3.5   |

# Happy paths
  Scenario: department head viewing list of applicants
    When I login with username "megan" and password "password1234"
    Then I should see a list of pending student applications

  Scenario: department head accepting an applicant
    When I click "Accept" on "bill"'s account
    Then "bill"'s application should be accepted

  Scenario: department head rejecting an applicant
    When I click "Reject" on "brandy"'s account
    Then "brandy"'s application should be rejected


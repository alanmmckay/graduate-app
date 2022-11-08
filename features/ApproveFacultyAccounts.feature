Feature: approve faculty accounts
  As a department head
  So that I can approve faculty accounts
  I would like to see a list of pending faculty accounts and be able to approve or deny them

Background:

  Given the following users have accounts:
    | username                   | password           | type       |
    | megan                      | password1234       | head       |

  And the following faculty have been authorized:
    | username                   | department         | is_head?   |
    | megan                      | CSE                | yes        |

  And the following faculty accounts have been created:
    | username                   | department         |
    | bill                       | CSE                |
    | brandy                     | CSE                |
    | bob                        | CSE                |

# Happy paths
Scenario: department head viewing pending faculty accounts
  When I login with username "megan" and password "password1234"
  Then I should see a list of pending faculty accounts

Scenario: department head authorizing account
  When I click "authorize" on "bill"'s account
  Then "bill"'s account should be authorized

Scenario: department head denying account
  When I click "deny" on "brandy"'s account
  Then "brandy"'s account should be removed

Scenario: faculty's account has been authorized
  When "bob"'s account has been authorized
  And I login with username "bob" and password "password"
  Then I should see a list of applications for my department

Feature: application status
  As a prospective student who has already applied
  So that I can check in on my approval status
  I would like to see the status of my application

Background:

  Given the following users have accounts:
    | username                   | password           | type       |
    | fred                       | password1234       | student    |
    | ted                        | password5678       | student    |
    | bread                      | password9101       | student    |
    | sally                      | sally4321          | faculty    |

  And the following applications have been submitted:
    | student                   | department         | gpa   |
    | fred                      | CSE                | 4.0   |
    | ted                       | CSE                | 2.0   |
    | bread                     | CSE                | 3.5   |

  And "fred"'s application has been accepted
  And "ted"'s application has been rejected

# Happy paths
Scenario: application pending
  When I login with username "bread" and password "password9101"
  Then I should see my application with status "pending"

Scenario: application accepted
  When I login with username "fred" and password "password1234"
  Then I should see my application with status "accepted"

Scenario: application rejected
  When I login with username "ted" and password "password5678"
  Then I should see my application with status "rejected"
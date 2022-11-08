Feature: sort applicants by important metrics
  As a faculty member
  So that I can consider stronger applicants
  I want to be able to sort applicants by some strength metric

Background:

  Given the following users have accounts:
    | username                   | password           | type       |
    | fred                       | password1234       | student    |
    | ted                        | password5678       | student    |
    | bread                      | password9101       | student    |
    | sally                      | sally4321          | faculty    |

  And the following faculty have been authorized:
    | username                   | department         |
    | sally                      | CSE                |

  And the following applications have been submitted:
    | student                   | department         | gpa   |
    | fred                      | CSE                | 4.0   |
    | ted                       | CSE                | 2.0   |
    | bread                     | CSE                | 3.5   |

# Happy paths
Scenario: sort by GPA
  When I sort by GPA
  Then I should see "fred" before "bread"



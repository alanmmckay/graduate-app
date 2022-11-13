Feature: list department applications
  As a faculty member
  So that I can review all of the applications to my department
  I would like to see a list of all of the applications to my department

Background:

  Given the following users have accounts:
    | username                   | password           | type       |
    | jerry                      | password1          | student    |
    | jamie                      | password2          | student    |
    | jasper                     | password3          | student    |
    | janet                      | password4          | student    |
    | julie                      | password5          | student    |
    | juan                       | password6          | student    |
    | larry                      | lazy4              | faculty    |

  And the following faculty have been authorized:
    | username | department |
    | larry    | CSE        |

  And the following applications have been submitted:
    | student                    | department        | gpa      |
    | jerry                      | CSE               | 3.7      |
    | jamie                      | CSE               | 3.2      |
    | jasper                     | CSE               | 3.1      |
    | janet                      | CSE               | 3.4      |
    | julie                      | CIV               | 3.5      |
    | juan                       | BME               | 4.0      |

# Happy paths
Scenario: see all department applications
  When I login with username "larry" and password "lazy4"
  Then I should see applications from "jerry, jamie, jasper, janet"

# Sad pathts
Scenario: should not see other department applications
  When I login with username "larry" and password "lazy4"
  Then I should not see any applications oustside of the "CSE" department
Feature: list department applications
  As a faculty member
  So that I can review all of the applications to my department
  I would like to see a list of all of the applications to my department

Background:

  Given the following users have accounts:
    | username                   | password           | type       |
    | jerry.uiowaSELT@gmail.com  | password1          | student    |
    | jamie.uiowaSELT@gmail.com  | password2          | student    |
    | jasper.uiowaSELT@gmail.com | password3          | student    |
    | janet.uiowaSELT@gmail.com  | password4          | student    |
    | julie.uiowaSELT@gmail.com  | password5          | student    |
    | juan.uiowaSELT@gmail.com   | password6          | student    |
    | larry.uiowaSELT@gmail.com  | lazy4              | faculty    |

  And the following faculty have been authorized:
    | username                   | department |
    | larry.uiowaSELT@gmail.com  | CSE        |

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
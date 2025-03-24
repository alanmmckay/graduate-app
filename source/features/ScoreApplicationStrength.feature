Feature: score application strength
  As a faculty user
  So that I can provide feedback on a student application
  I would like to provide a score for the application

Background: users that have submitted an application

  Given the following users have accounts:
    | username                   | password           | type       | department        |
    | fred.uiowaSELT@gmail.com   | password1234       | student    |                   |
    | james.uiowaSELT@gmail.com  | pass123456         | student    |                   |
    | sally.uiowaSELT@gmail.com  | sally4321          | faculty    | CSE               |

  And the following applications have been submitted:
    | first_name        | last_name       | citizenship      | gender | research_area     | degree_objective | degree_obj_major       | ug_institute               | ug_inst_city       | ug_gpa  | ug_deg_earned     | grad_inst               | grad_inst_city     | grad_gpa  | grad_deg_earned        | recommender_1     | recommender_2     | recommender_3     |
    | Fred              | Smith           | United States    | Male   | Machine Learning  | PhD              | CSE                    | Iowa State University      | Ames, Iowa         | 3.72/4  | Computer Science  | Iowa State University   | Ames, Iowa         | 3.81/4    | Computer Engineering   | Dr. James Dean    | Dr. Dan Smith     | Dr. James Jimmy   |

  And I am on the faculty application review page for faculty user "sally.uiowaSELT@gmail.com"

# Happy paths
Scenario: Score an application
  When I click on the application for student user: "fred.uiowaSELT@gmail.com"
  And I click on the score dropdown and select: "3"
  And I click the "submit score" button
  Then The application should be updated with the new score
  And I should see a flash: "Application has been updated" at the top of the page

# Sad paths
Scenario: Submit an application without giving a score
  When I click on the application for student user: "fred.uiowaSELT@gmail.com"
  And I click the "submit score" button
  Then The application should not be updated with a new score
  And I should see a flash: "No score provided for application" at the top of the page

Feature: add comments to application
  As a faculty user
  So that I can provide feedback on a student application
  I would like to add comments for the application

Background: users that have submitted an application

  Given the following users have accounts:
    | username                   | password           | type       | department        |
    | fred                       | password1234       | student    |                   |
    | james                      | pass123456         | student    |                   |
    | sally                      | sally4321          | faculty    | CSE               |

  And the following applications have been submitted:
    | username        | password       | type             | first_name        | last_name       | citizenship      | gender | research_area     | degree_objective | degree_obj_major       | ug_institute               | ug_inst_city       | ug_gpa  | ug_deg_earned     | grad_inst               | grad_inst_city     | grad_gpa  | grad_deg_earned        | recommender_1     | recommender_2     | recommender_3     |
    | fred            | password1234   | student          | Fred              | Smith           | United States    | Male   | Machine Learning  | PhD              | CSE                    | Iowa State University      | Ames, Iowa         | 3.72/4  | Computer Science  | Iowa State University   | Ames, Iowa         | 3.81/4    | Computer Engineering   | Dr. James Dean    | Dr. Dan Smith     | Dr. James Jimmy   |

  And I am on the faculty application review page for faculty user "sally"

# Happy paths
Scenario: Add comments to an application
  When I click on the application for student user: "fred"
  And I type: "test comments feedback" in the comments box
  And I click the "Add Comments" button
  Then The application should be updated with the new comments
  And I should see a flash: "Comments have been updated" at the top of the page

# Sad paths
Scenario: Click the submit comments button without adding any comments
  When I click on the application for student user: "fred"
  And I type: "" in the comments box
  And I click the "submit comments" button
  Then The application should be not be updated with the new comments
  And I should see a flash: "No comments have been added" at the top of the page
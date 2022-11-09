Feature: filter applications
  As a faculty user
  So that I can quickly view applications relating to my department
  I would like to filter the student applications

Background: faculty that have submitted an application review

  Given the following users have accounts:
    | username                   | password           | type       | department        |
    | fred                       | password1234       | student    |                   |
    | james                      | pass123456         | student    |                   |
    | sally                      | sally4321          | faculty    | CSE               |
    | ethan                      | ethan4321          | faculty    | CSE               |

  And the following applications have been submitted:
    | username        | password       | type             | first_name        | last_name       | citizenship      | gender | research_area     | degree_objective | degree_obj_major       | ug_institute               | ug_inst_city       | ug_gpa  | ug_deg_earned     | grad_inst               | grad_inst_city     | grad_gpa  | grad_deg_earned        | recommender_1     | recommender_2     | recommender_3     | comments                          |
    | fred            | password1234   | student          | Fred              | Smith           | United States    | Male   | Machine Learning  | PhD              | CSE                    | Iowa State University      | Ames, Iowa         | 3.72/4  | Computer Science  | Iowa State University   | Ames, Iowa         | 3.81/4    | Computer Engineering   | Dr. James Dean    | Dr. Dan Smith     | Dr. James Jimmy   | Looks good. I will review soon.   |
    | james           | pass123456     | student          | James             | Smith           | United States    | Male   | Machine Learning  | PhD              | BME                    | Iowa State University      | Ames, Iowa         | 3.72/4  | Computer Science  | Iowa State University   | Ames, Iowa         | 3.81/4    | Computer Engineering   | Dr. James Dean    | Dr. Dan Smith     | Dr. James Jimmy   |                                   |


# Happy paths
Scenario: faculty is able to filter the applications
  When I am on the "Application Review Page" for faculty user "sally"
  And I can see the application for student user "fred"
  And I can see the application for student user "james"
  And I click on the dropdown labeled "filter"
  And I select "CSE" from the dropdown
  Then I should see the application for student user "fred"
  And I should not see the application for student user "james"

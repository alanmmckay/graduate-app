Feature: review application details
  As a faculty user
  So that I can provide feedback on a student application
  I would like view a student's application details

Background: users that have submitted an application

  Given the following users have accounts:
  | username                   | password           | type       | department        |
  | fred                       | password1234       | student    |                   |
  | james                      | pass123456         | student    |                   |
  | sally                      | sally4321          | faculty    | CSE               |

  And the following applications have been submitted:
  | username        | password       | type             | first_name        | last_name       | citizenship      | gender | research_area     | degree_objective | degree_obj_major       | ug_institute               | ug_inst_city       | ug_gpa  | ug_deg_earned     | grad_inst               | grad_inst_city     | grad_gpa  | grad_deg_earned        | recommender_1     | recommender_2     | recommender_3     |
  | fred            | password1234   | student          | Fred              | Smith           | United States    | Male   | Machine Learning  | PhD              | CSE                    | Iowa State University      | Ames, Iowa         | 3.72/4  | Computer Science  | Iowa State University   | Ames, Iowa         | 3.81/4    | Computer Engineering   | Dr. James Dean    | Dr. Dan Smith     | Dr. James Jimmy   |

  And I am on the "Application Review Page" for faculty user "sally"

# Happy paths
Scenario: Application page loads successfully
  When I click on the application for student user: "fred"
  And I am on the application viewing page for student user: "fred"
  Then I should see a section labeled: "First Name: "
  And I should see a section labeled: "Last Name: "
  And I should see a section labeled: "Date Received: "
  And I should see a section labeled: "Gender: "
  And I should see a section labeled: "Research Area: "
  And I should see a section labeled: "Degree Objective: "
  And I should see a section labeled: "Degree Objective Major: "
  And I should see a section labeled: "Undergrad Institute: "
  And I should see a section labeled: "Undergrad Institute City: "
  And I should see a section labeled: "Undergrad Major: "
  And I should see a section labeled: "Undergrad Degree Earned: "
  And I should see a section labeled: "Graduate Institute: "
  And I should see a section labeled: "Graduate Institute City: "
  And I should see a section labeled: "Graduate Major: "
  And I should see a section labeled: "Graduate Degree Earned: "
  And I should see a section labeled: "Recommendation 1: "
  And I should see a section labeled: "Recommendation 2: "
  And I should see a section labeled: "Recommendation 3: "
  And I should see a section labeled: "Comments"
  And I should see a section labeled: "Applicant Score"
  And I should see a section labeled: "Background"
  And I should see a dropdown labeled: "Score"
  And I should see a dropdown labeled: "Background"
  And I should see a button labeled: "Add Comments"
  And I should see a button labeled: "Submit"

# Sad paths

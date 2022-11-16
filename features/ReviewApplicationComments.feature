Feature: review application comments
  As a faculty user
  So that I can provide feedback on a student application
  I would like view comments from other faculty on a student's application

Background: faculty that have submitted an application review

  Given the following users have accounts:
    | username                   | password           | type       | department        |
    | fred.uiowaSELT@gmail.com   | password1234       | student    |                   |
    | james.uiowaSELT@gmail.com  | pass123456         | student    |                   |
    | sally.uiowaSELT@gmail.com  | sally4321          | faculty    | CSE               |
    | ethan.uiowaSELT@gmail.com  | ethan4321          | faculty    | CSE               |

  And the following applications have been submitted:
    | first_name        | last_name       | citizenship      | gender | research_area     | degree_obj | degree_obj_major       | ug_inst                    | ug_inst_city       | ug_gpa  | ug_deg_earned     | grad_inst               | grad_inst_city     | grad_gpa  | grad_deg_earned        | recommender_1     | recommender_2     | recommender_3     | comments                          |
    | Fred              | Smith           | United States    | Male   | Machine Learning  | PhD        | CSE                    | Iowa State University      | Ames, Iowa         | 3.72/4  | Computer Science  | Iowa State University   | Ames, Iowa         | 3.81/4    | Computer Engineering   | Dr. James Dean    | Dr. Dan Smith     | Dr. James Jimmy   | Looks good. I will review soon.   |

  And The following feedback has been given on the application for "fred":
    | username                   | department       | comments                                                               | application_score  |
    | ethan.uiowaSELT@gmail.com  | CSE              | This looks good so far. I will discuss further with my colleagues.     | 3                  |


# Happy paths
Scenario: faculty is able to see comments from other faculty
  When I am on the "Application Review Page" for faculty user "sally.uiowaSELT@gmail.com"
  And I can see the application for student user "fred.uiowaSELT@gmail.com"
  Then I should see the comments from faculty user "ethan.uiowaSELT@gmail.com"
  And I should see the rating from faculty user "ethan.uiowaSELT@gmail.com"



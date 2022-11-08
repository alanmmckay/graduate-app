Feature: add comments to application
  As a faculty user
  so that I can provide feedback on a student application
  I would like to add comments for the application

Background: users that have submitted an application

  Given the following users have accounts:
    | username                   | password           | type       | department        |
    | fred                       | password1234       | student    |                   |
    | james                      | pass123456         | student    |                   |
    | sally                      | sally4321          | faculty    | machine learning  |

  And "james" has submitted an application for department "machine learning"
  And "fred" has submitted an application for department "machine learning"
  And I am on the faculty application review page for faculty user "sally"

# Happy paths
Scenario: Add comments to an application
  When I click on the application for student user: "fred"
  And I type: "test comments feedback" in the comments box
  And I click the "submit comments" button
  Then The application should be updated with the new comments
  And I should see a flash: "Comments have been updated" at the top of the page

# Sad paths
Scenario: Click the submit comments button without adding any comments
  When I click on the application for student user: "fred"
  And I type: "" in the comments box
  And I click the "submit comments" button
  Then The application should be not be updated with the new comments
  And I should see a flash: "No comments have been added" at the top of the page
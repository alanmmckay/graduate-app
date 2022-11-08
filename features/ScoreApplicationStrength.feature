Feature: score application strength
  As a faculty user
  so that  I can provide feedback on a student application
  I would like to provide a score for the application

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
Scenario: Score an application
  When I click on the application for student user: "fred"
  And I click on the score dropdown and select: "3"
  And I click the "submit application" button
  Then The application should be updated with the new score
  And I should see a flash: "Application has been updated" at the top of the page

# Sad paths
Scenario: Submit an application without giving a score
  When I click on the application for student user: "james"
  And I click the "submit application" button
  Then The application should not be updated with a new score
  And I should see a flash: "No score provided for application" at the top of the page

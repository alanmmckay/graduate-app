Feature: submit extraneous documents
  As a prospective student
  So that I can apply for a department / program
  I would like to submit extraneous documents to help with approval

Background: users that are submitting an application

  Given the following users have accounts:
    | username                   | password           | type       | department        |
    | fred                       | password1234       | student    |                   |
    | james                      | pass123456         | student    |                   |
    | sally                      | sally4321          | faculty    | CSE               |
    | ethan                      | ethan4321          | faculty    | CSE               |

  And I am on the "Submit Application Form" page for student user "fred"

# Happy paths
Scenario: Upload txt file to the page
  When I click on the button "Upload Documents"
  And a pop up screen of my file explorer/finder appears
  And I select the document "test.txt"
  And I select "upload" from my file explorer
  Then I should be brought back to the "Submit Application Form" page for student user "fred"
  And I should see the file "test.txt" uploaded to the page

# Sad paths
Scenario: Upload invalid file to the page
  When I click on the button "Upload Documents"
  And a pop up screen of my file explorer/finder appears
  And I select the document "test.py"
  And I select "upload" from my file explorer
  Then I should be brought back to the "Submit Application Form" page for student user "fred"
  And I should see a flash "File type not valid" at the top of the page
  And I should not see the file "test.py" uploaded to the page
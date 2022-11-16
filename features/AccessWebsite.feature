Feature: access website
  As a user
  I would like to be able to follow a url and see a website

Scenario: follow url
  When I follow the link to the website
  Then I should see a page with content

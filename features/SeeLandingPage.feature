Feature: see landing page
  As a user
  I would like to see a landing page so that I know I've accessed the page.

Background:

  Given I am on the home page

Scenario: see landing page
  When I follow the link to the website
  Then I should see a landing page that says "Landing page"
Given /^I am on the home page$/ do
  visit users_path
end

When /^I follow the link to the website$/ do
  visit users_path
end

Then /^I should see a landing page that says "(.*?)"$/ do |content|
  expect(page).to have_content(content)
end

Then /^I should see a page with content$/ do
  expect(page).to have_content
end
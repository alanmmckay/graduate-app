Given /^I am on the home page$/ do
  visit users_path
end

When /^I follow the link to the website$/ do
  visit 'users/login'
end

Then /^I should see a landing page that says "(.*?)"$/ do |content|
  expect(page).to have_content(content)
end

Then /^I should see a page with content$/ do
  expect(page).to have_content
end

When(/^I click "([^"]*)"$/) do |object|
  click_on object
end

And(/^I input "([^"]*)" for "([^"]*)"$/) do |input, field|
  fill_in field, with: input
end

Then(/^I should see "([^"]*)"$/) do |object|
  expect(page).to have_content(object)
end

When(/^the following users have accounts:$/) do |users_table|
  # table is a table.hashes.keys # => [:username, :password, :first-name, :last-name]
  users_table.hashes.each do |user|
    User.create!(:email => user[:email], :password => user[:password], :password_confirmation => user[:password], :lname => user[:first_name], :fname => user[:last_name])
  end
end

Then(/^(\d+) users should exist$/) do |n_seeds|
  expect(User.count).to eq n_seeds
end

Then(/^I should not see "([^"]*)"$/) do |object|
  expect(page).to  have_no_content(object)
end
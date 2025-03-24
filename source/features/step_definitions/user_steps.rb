Then /^I should see a landing page that says "(.*?)"$/ do |content|
  expect(page).to have_content(content)
end

When /^I have logged in$/ do
  visit users_login_path
  fill_in
end

When /^I have logged in with "([^"]*)" and "([^"]*)"$/ do |email, password|
  visit users_login_path
  fill_in "Email", with: email
  fill_in "Password", with: password
  click_on "Login"
end
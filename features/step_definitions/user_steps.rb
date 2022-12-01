Then /^I should see a landing page that says "(.*?)"$/ do |content|
  expect(page).to have_content(content)
end

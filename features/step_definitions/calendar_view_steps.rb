Given(/^a user visits calendar view page$/) do
  visit root_path
end

When(/^the user clicks on the Calendar View link$/) do
  click_link "Calendar View"
end

Then(/^the user should see a calendar$/) do
  pending # express the regexp above with the code you wish you had
end
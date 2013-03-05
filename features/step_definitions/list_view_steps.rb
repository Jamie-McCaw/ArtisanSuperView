@api_key = '1ad5b3db20aa'

Given(/^a user visits list view page$/) do
  visit root_path
end

When(/^the user clicks on the List View link$/) do
	click_link "List View"
end

Then(/^the user should see the list of Project names$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^the user should see the iteration number$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^the user should see the members names$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^the user should see the total points in the Ready column$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^the user should see the total points in the Working column$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^the user should see the total points in the completed column$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^the user should see if the project is completed or not$/) do
  pending # express the regexp above with the code you wish you had
end

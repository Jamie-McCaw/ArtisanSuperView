Given(/^a user visits list view page$/) do
  visit root_path
end

When(/^the user clicks on the List View link$/) do
	click_link "List View"
end

Then(/^the user should see a table of information/) do
  page.should have_selector('#here_table')
end

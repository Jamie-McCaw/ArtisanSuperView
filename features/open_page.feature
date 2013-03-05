Feature: User opens list view


	Scenario: Page opened
		Given a user visits list view page
		When the user clicks on the List View link
		Then the user should see the list of Project names
		And the user should see the iteration number
		And the user should see the members names
		And the user should see the total points in the Ready column
		And the user should see the total points in the Working column
		And the user should see the total points in the completed column
		And the user should see if the project is completed or not
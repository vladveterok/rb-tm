Feature: Manage Projects
  In order to use my favorite ToDo
	As a user
	I want to create, update, and delete Projects
	
	#Scenario: Log In
		#Given I am on the "projects" page
		#When I fill in "Email" field with "test@test.test"
		#And I fill in "Password" field with "12345678"
		#And I press "Log in" button
		#  Then I am redirected to "http://localhost:3000/projects"
		#Then I should be on the "/projects" page

	Scenario: Create a project
		Given I am logged in as a user
		Given I am on the "projects" page
	#	When I press "Add TODO List" button
	#	Then I should see a new project
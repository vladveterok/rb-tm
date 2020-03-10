Feature: Manage Projects
  In order to use my favorite ToDo
	As a user
	I want to create, update, and delete Projects
	
	Scenario: Screate a project
		Given I am on the "projects" page
		When I press "Add TODO List" button
		Then I should see a new project
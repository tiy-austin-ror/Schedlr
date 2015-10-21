Feature: Rooms
  In order to user the application
  As a user or an admin
  I want to be able to visit various rooms in the application

  Scenario: Visiting a room as a user
    Given I am an existing User
    And I am on the login page
    When I attempt to sign in
    And I press "Log in"
    When I click "Rooms"
    Then I should see "Rooms Directory"

  @skip
  Scenario: Creating a room as an admin

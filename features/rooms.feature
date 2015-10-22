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
    Given I am an admin
    And I am logged in
    When I click "Rooms"
    And I click "New Room"
    And I fill in the new room form with "Foobar" as the room name
    And I press "Create Room"
    Then I should see "Room was successfully created."
    And I should see "Room Name: Foobar"

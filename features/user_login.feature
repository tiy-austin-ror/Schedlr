Feature: User Login
  In order to login
  As a user
  I want to be able to login in to the app

  Scenario: Existing User Signs In
    Given I am an existing User
    And I am on the login page
    When I attempt to sign in
    And I press "Log in"
    Then I should see "Signed in successfully."

  Scenario: New User Signs Up
    Given I am on the new user page
    When I fill out the new user form
    And I press "Sign up"
    Then I should see "Welcome! You have signed up successfully."

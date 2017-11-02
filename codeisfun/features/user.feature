Feature: user
  In order to let users sign in to Codeisfun web application and can see edit their profile.

  Background:
    Given I am a user

  Scenario: user can log in Codeisfun page
  The user should be able to sign in

    When I visit the root page
    Then I should see a "Sign In" link
    When I click the "Sign In" link
    Then I should see a log in form
    When I add the information and submit Sign in
    Then I should see your email

  Scenario: users can edit their profile

    When I logged in and see my name at root page
    Then I should see a "Your Profile" link at the menu
    When I click the "Your Profile" link at the menu
    Then I should see a "Update My profile" link at page
    When I click the "Update My profile" link at page
    Then I should see the form to edit my profile
    When I fill in the details and submit my profile
    Then I should see the successful message in the root page

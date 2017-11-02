Feature: user_signup
  In order to let new users sign up to Codeisfun web application.

  Scenario: user can registration Codeisfun page
  The user should be able to sign up

    Given I am sign up for new user
    When I visit the root page
    Then I should see a "Sign Up" button
    When I click the "Sign Up" button
    Then should see a registration form
    When I add the information and submit
    Then I should see my email logged in
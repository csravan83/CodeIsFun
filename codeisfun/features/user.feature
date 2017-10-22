Feature: user
  In order to let users sign up and sign in to Codeisfun web application

  Scenario: user can registration Codeisfun page
    The user should be able to sign up

    Given I am sign up for new user
    When I visit the root page
    Then I should see a "Sign Up" button
    When I click the "Sign Up" button
    Then should see a registration form
    When I add the information and submit
    Then I should see my email logged in

  Scenario: user can log in Codeisfun page
  The user should be able to sign in

    Given I am a user
    When I visit the root page
    Then I should see a "Sign In" link
    When I click the "Sign In" link
    Then should see a log in form
    When I add the information and submit Sign in
    Then I should see your email
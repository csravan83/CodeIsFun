Feature: admin
  In order to let admins signin to codeisfun and access the dashboard

  Scenario: Admin can login to codeisfun page

    Given I am an Admin
    When I visit the root page
    Then I should see the login Link
    When I click the login link
    Then I Should see a sign in form
    When I fill in the details and submit
    Then I Should see the Admin Dashboard Link
    When I Click on Admin Dashboard
    Then I should see the User model
    When I click on user model

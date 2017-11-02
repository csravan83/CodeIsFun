Feature: admin
  In order to let admins signin to codeisfun ,access the dashboard, and create the problems

  Background:
    Given I am an Admin

  Scenario: Admin can login to codeisfun page

    When I visit the root page
    Then I should see the login Link
    When I click the login link
    Then I Should see a sign in form
    When I fill in the details and submit
    Then I Should see the Admin Dashboard Link
    When I Click on Admin Dashboard
    Then I should see the User model
    When I click on user model

#  Scenario: Admin can ban users

#  Scenario: Admin can create the problem
#    Given I am an Admin
#    When  I logged in and see my name at root page
#    Then  I should see the problems Link
#    When  I click on the problems Link
#    Then  I should see the list of categories
#    When  I click one of the category
#    Then  I should see an add button
#    When  I click the add button
#    Then  I should see a problem form
#    When  I fill in the details and submit form
#    Then  I should see the problem list
#


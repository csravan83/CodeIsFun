Feature: admin
  In order to let admins signin to codeisfun ,access the dashboard, and create the problems

  Background:
    Given I am an Admin
    When I visit the root page
    Then I should see the login Link
    When I click the login link
    Then I Should see a sign in form
    When I fill in the details and submit

  Scenario: Admin can access the Admin Dashboard

    Then I Should see the Admin Dashboard Link
    When I Click on Admin Dashboard
    Then I should see the User model
    When I click on user model

  Scenario: Admin can add category and create the problem
    And  There is a category
    And  I want to add the problem
    Then I should see the problem
    When I click on the problems link
    Then I should see the create new category button
    When I click on the create new category button
    Then I should see the input form
    When I fill in the category name and submit
    Then I should see new category button
    When I click on the category
    Then I should see an add problem button
    When I click the add problem button
    Then I should see the problem form
    When I fill in the problem details and submit
    Then I should see the details of problem

#  Scenario: Admin can ban users




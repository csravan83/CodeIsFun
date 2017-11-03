Given("I am an Admin") do
  @adminuser = FactoryGirl.create :adminuser
end

Then("I should see the login Link") do
  expect(page).to have_link('Sign In')
end

When("I click the login link") do
  find_link('Sign In').click
end

Then("I Should see a sign in form") do
  expect(page).to have_selector("form")
end

When("I fill in the details and submit") do
  fill_in 'Username', with: @adminuser.username
  fill_in 'Password', with: @adminuser.password
  click_button 'Sign in'
  #save_and_open_page
end

# Scenario: Admin can access the Admin Dashboard

Then("I Should see the Admin Dashboard Link") do
  expect(page).to have_link("Admin Dashboard")
end

When("I Click on Admin Dashboard") do
  find_link('Admin Dashboard').click
end

Then("I should see the User model") do
  expect(page).to have_link("User")

end

When("I click on user model") do
  find('ul.nav-pills:nth-child(1) > li:nth-child(3) > a:nth-child(1)').click
  # save_and_open_page
end

# Scenario: Admin can add category and create the problem

When("There is a category") do
  @category = FactoryGirl.create :category
end

When("I want to add the problem") do
  @problem = FactoryGirl.create :problem
end

Then("I should see the problem") do
  expect(page).to have_link('Problems')
end

When("I click on the problems link") do
    click_on("Problems")
end

Then("I should see the create new category button") do
  expect(page).to have_link('Create New Category')
end

When("I click on the create new category button") do
  find_link('Create New Category').click
end

Then("I should see the input form") do
  expect(page).to have_selector("form")
end

When("I fill in the category name and submit") do
  fill_in('Name', :with => 'Data Structure')
  click_button 'Create'
end

Then("I should see new category button") do
  expect(page).to have_link(@category.name)
end

When("I click on the category") do
  click_on(@category.name)
end

Then("I should see an add problem button") do
  expect(page).to have_link('Add Problem')
end

When("I click the add problem button") do
  click_on('Add Problem')
end

Then("I should see the problem form") do
  expect(page).to have_selector("form")
end

When("I fill in the problem details and submit") do
  find('#problem_category_id').find(:option, @problem.category.name).select_option
  fill_in 'Title', with: @problem.title
  fill_in 'Description', with: @problem.description
  fill_in 'Input', with: @problem.input
  fill_in 'Output', with: @problem.output
  fill_in 'Tc1', with: @problem.TC1
  fill_in 'Tc2', with: @problem.TC2
  fill_in 'Tc3', with: @problem.TC3
  page.find(:select, name: 'problem[status]').find(:option, @problem.status).select_option
  fill_in 'Author', with: @problem.author
  click_button 'Create Problem'
  # save_and_open_page
end

Then("I should see the details of problem") do
  expect(page).to have_content "Title: #{@problem.title}"
  expect(page).to have_content "Description: #{@problem.description}"
  expect(page).to have_content "Input: #{@problem.input}"
  expect(page).to have_content "Output: #{@problem.output}"
  expect(page).to have_content "Tc1: #{@problem.TC1}"
  expect(page).to have_content "Tc2: #{@problem.TC2}"
  expect(page).to have_content "Tc3: #{@problem.TC3}"
  expect(page).to have_content "Status: #{@problem.status}"
  expect(page).to have_content "Author: #{@problem.author}"
end




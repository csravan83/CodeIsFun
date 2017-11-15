# Scenario: user can registration Codeisfun page


Given("I am sign up for new user") do
  @user = FactoryGirl.build :newuser
end

When("I visit the root page") do
  visit '/'
end

Then("I should see a {string} button") do |string|
  expect(page).to have_link('Sign Up')
end

When("I click the {string} button") do |string|
  find_link('Sign Up').click
end

Then("should see a registration form") do
  expect(page).to have_selector("form")
end

When("I add the information and submit") do
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: @user.password
  fill_in 'Password confirmation', with: @user.password_confirmation
  click_button 'Sign up'
  #save_and_open_page
end

Then("I should see my email logged in") do
  expect(page).to have_content "Hello #{@user.email} Have Fun"
end

# Scenario: user can log in Codeisfun page


Given("I am a user") do
  @olduser = FactoryGirl.create :olduser
end

Then("I should see a {string} link") do |string|
  expect(page).to have_link('Sign In')
end

When("I click the {string} link") do |string|
  find_link('Sign In').click
  # save_and_open_page
end
Then("I should see a log in form") do
  expect(page).to have_selector("form")
  # save_and_open_page
end

When("I add the information and submit Sign in") do
  fill_in 'Username', with: @olduser.username
  fill_in 'Password', with: @olduser.password
  click_button 'Sign in'
  # save_and_open_page
end

Then("I should see your email") do
  expect(page).to have_content "Hello #{@olduser.email} Have Fun"
end

# Scenario: users can edit their profile

When("I logged in and see my name at root page") do
  visit '/'

  find_link('Sign In').click

  fill_in 'Username', with: @olduser.username
  fill_in 'Password', with: @olduser.password
  click_button 'Sign in'

  expect(page).to have_content "Hello #{@olduser.email} Have Fun"

end

Then("I should see a {string} link at the menu") do |string|
  expect(page).to have_link("Your Profile")
  # save_and_open_page
end

When("I click the {string} link at the menu") do |string|
  find_link('Your Profile').click
  # save_and_open_page
end

Then("I should see a {string} link at page") do |string|
  expect(page).to have_link("Update My profile")
end

When("I click the {string} link at page") do |string|
  find_link('Update My profile').click
end

Then("I should see the form to edit my profile") do
  expect(page).to have_selector("form")
  # save_and_open_page
end

When("I fill in the details and submit my profile") do
  fill_in 'Username', with: @olduser.username
  fill_in 'Email',with: @olduser.email
  fill_in 'Password', with: @olduser.password
  fill_in 'Password confirmation', with: @olduser.password
  fill_in 'Current password', with: @olduser.password
  click_button 'Update'
  # save_and_open_page
end

Then("I should see the successful message in the root page") do
  expect(page).to have_text("Your account has been updated successfully")
end



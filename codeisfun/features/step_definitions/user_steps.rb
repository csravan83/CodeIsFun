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
end
Then("should see a log in form") do
  expect(page).to have_selector("form")
  #save_and_open_page
end

When("I add the information and submit Sign in") do
  fill_in 'Email', with: @olduser.email
  fill_in 'Password', with: @olduser.password
  click_button 'Sign in'
  # save_and_open_page
end

Then("I should see your email") do
  expect(page).to have_content "Hello #{@olduser.email} Have Fun"
end



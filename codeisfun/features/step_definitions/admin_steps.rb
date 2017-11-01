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
  fill_in 'Email', with: @adminuser.email
  fill_in 'Password', with: @adminuser.password
  click_button 'Sign in'
  #save_and_open_page
end

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





Given(/^I am an existing User$/) do
  c = Company.create(name: 'Ryans fabulous coding co.')
  user = User.new(email: 'user@example.com')
  user.company = c
  user.password = 'password'
  user.save!
end

Given(/^I am on the login page$/) do
  visit(new_user_session_path)
end

Given(/^I am on the new user page$/) do
  visit(new_user_registration_path)
end

When(/^I attempt to sign in$/) do
  fill_in("Email", with: "user@example.com")
  fill_in("Password", with: 'password')
end

When(/^I fill out the new user form$/) do
  select("Compnay", from: 'Test Company 1')
  fill_in("First name", with: 'jane')
  fill_in("Last name", with: 'doe')
  fill_in("Department", with: 'foobar')
  fill_in("Email", with: "user@example.com")
  fill_in("Password", with: 'password')
  fill_in("Password confirmation", with: 'password')
end

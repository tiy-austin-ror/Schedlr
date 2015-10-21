Given(/^I am an admin$/) do
  c = Company.create(name: 'foo bar inc')

  user = User.new({
    email: 'admin@example.com',
    admin: true
  })

  user.company  = c
  user.password = 'password'
  user.save!

  s = Site.create(name: 'fizzbuzz',)
  s.company = c
  s.save

  b = Building.new(name: 'foobaz')
  b.site = s
  b.save
end

Given(/^I am logged in$/) do
  visit(new_user_session_path)
  fill_in("Email", with: 'admin@example.com')
  fill_in("Password", with: 'password')
  click_button("Log in")
end

When(/^I fill in the new room form with "(.*?)" as the room name$/) do |room_name|
  fill_in("Name", with: room_name)
  fill_in("Capacity", with: 100)
  select("foobaz", from: "Building")
end

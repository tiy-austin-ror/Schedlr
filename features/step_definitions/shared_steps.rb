When(/^I click "(.*?)"$/) do |link_name|
  click_link(link_name)
end

When(/^I press "(.*?)"$/) do |button_name|
  click_button(button_name)
end

Then(/^I should see "(.*?)"$/) do |text|
  assert page.has_content?(text)
end

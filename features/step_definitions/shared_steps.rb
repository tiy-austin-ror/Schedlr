When(/^I click "(.*?)"$/) do |link_name|
  #puts page.html << For debugging
  click_link(link_name)
end
#Press is for buttons 'click' is for links
When(/^I press "(.*?)"$/) do |button_name|
  click_button(button_name)
end

Then(/^I should see "(.*?)"$/) do |text|
  assert page.has_content?(text)
end

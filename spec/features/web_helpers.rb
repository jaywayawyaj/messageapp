def submit_two_messages
  visit '/'
  fill_in("message", :with => 'test1')
  click_button('submit')
  fill_in('message', :with => 'test2')
  click_button('submit')
end

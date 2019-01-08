def submit_a_message
  visit '/'
  fill_in('message', :with => 'This is a test message')
  click_button('submit')
end

def submit_a_tag_and_a_message
  visit '/'
  fill_in('message', :with => 'This is a test message')
  fill_in('tag', :with => 'testtag')
  click_button('submit')
end

def submit_two_messages
  visit '/'
  fill_in("message", :with => 'test1')
  click_button('submit')
  fill_in('message', :with => 'test2')
  click_button('submit')
end

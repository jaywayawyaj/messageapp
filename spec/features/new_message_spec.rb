feature 'new message' do
  scenario 'send new message and display it' do
    visit '/'
    fill_in('message', :with => 'This is a test message')
    click_button('submit')
    expect(page).to have_content('This is a test mess')
  end
end

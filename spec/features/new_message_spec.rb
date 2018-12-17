feature 'new message' do
  scenario 'send new message and display it'do
    visit '/'
    fill_in('Message', :with => 'This is a test message')
    click_button('Send')
    expect(page).to have_content('This is a test message')
  end
end

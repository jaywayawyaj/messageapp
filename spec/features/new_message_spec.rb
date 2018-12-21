feature 'new message' do
  scenario 'send new message and display it' do
    submit_a_message
    expect(page).to have_content('This is a test mess')
  end
end

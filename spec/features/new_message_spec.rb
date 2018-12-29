feature 'new message' do
  scenario 'empty message does not save' do
    Timecop.freeze
    visit('/')
    click_button('submit')
    expect(page).not_to have_content(Time.now)
  end

  scenario 'send new message and display it' do
    submit_a_message
    expect(page).to have_content('This is a test mess')
  end
end

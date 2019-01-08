feature 'new tag' do
  scenario 'empty tag and message saves' do
    visit('/')
    submit_a_message
    expect(page).to have_content('This is a test')
    expect(page).not_to have_content('testtag')
  end

  scenario 'send new message and display it' do
    submit_a_tag_and_a_message
    expect(page).to have_content('testtag')
  end
end

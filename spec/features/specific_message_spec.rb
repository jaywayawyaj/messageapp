feature "Visit a message page" do
  scenario "it routes you to an individual message page" do
    Timecop.freeze
    submit_two_messages
    click_link 'This is a test mess'
    expect(page).to have_content 'This is a test mess'
    expect(page).to have_content Time.now.strftime("%H:%M:%S - %d/%m/%y")
  end
end

feature "Visit a message page" do
  scenario "it routes you to an individual message pagie" do
    Timecop.freeze
    submit_two_messages
    click_link 'test1'
    expect(page).to have_content 'test1'
    expect(page).to have_content Time.now
  end
end

feature "Reverse message history with time" do
  scenario "displays message history with most recent first" do
    Timecop.freeze
    submit_two_messages
    expect(page).to have_content "MessageApp"
    expect(page).to have_content 'test2'
    expect(page).to have_content 'test1'
  end
end

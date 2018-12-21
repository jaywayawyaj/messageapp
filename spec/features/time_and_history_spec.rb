feature "Message history with time" do
  scenario "display full message history with time" do
    Timecop.freeze
    submit_two_messages
    expect(page).to have_content('test1')
    expect(page).to have_content Time.now.strftime("%H:%M:%S - %d/%m/%y")
    expect(page).to have_content('test2')
  end
end

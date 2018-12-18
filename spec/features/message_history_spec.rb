feature "Message history" do
  scenario "display full message history" do
    submit_two_messages
    expect(page).to have_content('test1')
    expect(page).to have_content('test2')
  end
end

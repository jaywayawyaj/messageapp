feature "Back to homepage" do
  scenario "Button returns you to homepage" do
    submit_two_messages
    click_link 'test1'
    click_link 'Back to Homepage'
    expect(page.current_path).to eq("/")
  end
end

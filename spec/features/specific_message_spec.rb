feature "Visit a message page" do
  scenario "it routes you to an individual message page" do
    Timecop.freeze
    submit_two_messages
    click_link 'test1'
    expect(page).to have_content 'test1'
    expect(page).to have_content Time.now.strftime("%H:%M:%S - %d/%m/%y")
  end
end

feature Message do
  context 'Seeing a message' do
    scenario 'click on a message shows the full text of the message' do
      message = Message.create(text: "A fancy message!")
      visit '/'
      click_on 'A fancy message!'
      expect(page.current_path).to eq("/messages/#{message.id}")
      expect(page).to have_content('A fancy message!')
    end
  end
end

feature 'edit' do
  scenario 'edit message possible from message screen' do
    message = Message.create(text: "An edit message!")
    visit '/'
    click_on "An edit message!"
    click_button "Edit message"
    expect(page.current_path).to eq("/edit-message/#{message.id}")
    expect(page).to have_css('textarea[name="message"]')
    expect(page).to have_content(message.text)
  end

  scenario 'changing a message updates it' do
    message = Message.create(text: "An edit message!")
    visit '/'
    click_on "An edit message!"
    click_button "Edit message"
    fill_in('message', with: "change the message")
    expect(page.current_path).to eq "/edit-message/#{message.id}"
    expect(page).to have_content "change the message"
  end
end

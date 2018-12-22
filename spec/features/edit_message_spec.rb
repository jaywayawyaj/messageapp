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
    Message.create(:text => "An edit message!", :id => 4)
    visit '/'
    click_on "An edit message!"
    click_button "Edit message"
    fill_in('message', with: "change the message")
    click_on 'submit'
    expect(page.current_path).to eq "/messages/4"
    expect(page).to have_content "change the message"
  end
end

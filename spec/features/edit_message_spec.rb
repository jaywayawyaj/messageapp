feature 'edit' do
  scenario 'edit message possible from message screen' do
    submit_a_message
    click_button 'edit message'
    expect(page.current_path).to eq("/edit-message/#{message.id}")
    expect(page).to have_css('textarea[name="message"]')
    expect(page).to have_content(message.text)
  end
end

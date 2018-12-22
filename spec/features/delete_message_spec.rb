feature 'edit' do
  scenario 'edit message possible from message screen' do
    Message.create(text: "Delete me!")
    visit '/'
    click_on "Delete me!"
    click_button "Delete message"
    expect(page.current_path).to eq('/')
    expect(page).not_to have_content("Delete me!")
  end
end

feature 'homepage' do
  scenario 'expect homepage to have header, textbox and submit button' do
    visit('/')
    expect(page).to have_content "MessageApp"
    expect(page).to have_css('textarea[name="message"]')
  end
end

feature "Message history" do
  scenario "display full message history" do
    visit '/'
    fill_in('Message', :with => 'test1')
    fill_in('Message', :with => 'test2')
    click_button('Send')
    expect(page).to have_content('test1')
    expect(page).to have content('test2')
  end
end

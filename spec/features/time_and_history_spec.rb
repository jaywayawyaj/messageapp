feature "Message history with time" do
  scenario "display full message history with time" do
    Timecop.freeze
    visit '/'
    fill_in('message', :with => 'test1')
    click_button('Send')
    fill_in('message', :with => 'test2')
    click_button('Send')
    expect(page).to have_content('test1')
    expect(page).to have_content Time.now
    expect(page).to have_content('test2')
  end
end

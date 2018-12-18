feature "Reverse essage history with time" do
  scenario "displays message history with most recent first" do
    Timecop.freeze
    visit '/'
    fill_in('message', :with => 'test1')
    click_button('Send')
    fill_in('message', :with => 'test2')
    click_button('Send')
    expect(page).to have_content "MessageApp"
    expect(page).to have_content 'test2'
    expect(page).to have_content 'test1'
  end
end

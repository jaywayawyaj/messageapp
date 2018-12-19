RSpec::Matchers.define :appear_before do |later_content|
  match do |earlier_content|
    begin
      page.body.index(earlier_content) < page.body.index(later_content)
    end
  end
end

feature "Reverse message history with time" do
  scenario "displays message history with most recent first" do
    Timecop.freeze
    submit_two_messages
    fill_in('message', :with => 'test3')
    click_button('submit')
    expect('test2').to appear_before('test1')
    expect('test1').not_to appear_before('test3')
  end
end

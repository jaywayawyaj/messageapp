require 'orderly'
feature "Reverse message history with time" do
  scenario "displays message history with most recent first" do
    Timecop.freeze
    submit_two_messages
    expect('test2').to appear_before('test1')
  end
end

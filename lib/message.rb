class Message
  attr_reader :text, :time, :id

  def initialize(text, id)
    @text = text
    @time = Time.new
    @id = id
  end
end

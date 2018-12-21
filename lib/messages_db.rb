class Message
  include DataMapper::Resource

  property :id,           Serial
  property :text,         String
  property :created_at,   DateTime

  def display
    text[0..19]
  end

  def time
    created_at.strftime("%H:%M:%S - %d/%m/%y")
  end
end

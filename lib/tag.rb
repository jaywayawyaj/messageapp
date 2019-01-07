class Tag
  include DataMapper::Resource

  property :id,         Serial
  property :text,       String

  has n, :taggings
  has n, :messages, :through => :taggings

  def show
    puts @text
  end
end

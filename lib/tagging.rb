class Tagging
  include DataMapper::Resource

  belongs_to :tag,   :key => true
  belongs_to :message, :key => true

end

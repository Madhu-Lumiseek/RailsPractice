class Author
  include Mongoid::Document
  field :name, type: String
  field :title, type: String

  has_many :posts
end

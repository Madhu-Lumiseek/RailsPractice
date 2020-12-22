class Post
  include Mongoid::Document
  field :author_name, type: String
  field :title, type: String
  field :body, type: String

  belongs_to :author
  validates_presence_of :author
end

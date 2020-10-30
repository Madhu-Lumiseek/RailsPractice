class Author
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  validates :name, format: {with: /[a-zA-Z]/}, presence: true
  field :age, type: Integer
  validates :age, presence: true

  has_many :posts
end

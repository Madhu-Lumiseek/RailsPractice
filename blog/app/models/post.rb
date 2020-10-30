class Post
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated
  has_many :post_attachments, dependent: :destroy
  accepts_nested_attributes_for :post_attachments
  # field :id, type: String
  field :author_name, type: String
  # validates :name, format: {with: /[a-zA-Z]/}, presence: true
  field :title, type: String
  validates :title, format: {with: /[a-zA-Z]/}, presence: true
  field :genre, type: String
  validates :genre, format: {with: /[a-zA-Z]/}, presence: true
  field :noofpages, type: Integer
  validates :noofpages, presence: true
  field :description, type: String
  validates :description, format: {with: /[a-zA-Z]/}, presence: true

  belongs_to :author, :optional => true
  validates_presence_of :author
end

class Postt
  include Mongoid::Document
  field :title, type: String
  field :genre, type: String
  field :noofpages, type: Integer
  field :rating, type: Integer
  field :canreadanyone, type: Mongoid::Boolean
  field :description, type: String
end

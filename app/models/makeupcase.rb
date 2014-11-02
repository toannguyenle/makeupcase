class Makeupcase
  include Mongoid::Document
  field :product_id, type: String
  field :user_id, type: String
end

class Product
  include Mongoid::Document
  field :product_id, type: String
  field :brand, type: String
  field :name, type: String
  field :volume, type: String
  field :sku, type: String
  field :price, type: Float
  field :review, type: String
  field :like_or_not, type: String
  field :opened_date, type: String
  field :expiration_date, type: String
  field :category, type: String
  field :user_id, type: String
end

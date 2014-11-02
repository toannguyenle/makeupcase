class Product
  include Mongoid::Document
  field :brand, type: String
  field :name, type: String
  field :size, type: String
  field :upc, type: String
  field :ean13, type: String
  field :upc_e, type: String
  field :category, type: String
  field :avg_price, type: Float
  field :manufacturer, type: String
  field :ingredients, type: String
  field :short_description, type: String
  field :full_description, type: String
  field :image_urls, type: String
  field :date_first_use, type: Date
  field :date_expired, type: Date
  field :like_or_not, type: Mongoid::Boolean
  field :review, type: String

  belongs_to :user
end

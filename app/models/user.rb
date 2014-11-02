class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  has_secure_password
  field :name, type: String
  field :email, type: String
  field :agree_marketing, type: Mongoid::Boolean
  field :password_digest, type: String
  field :member_since, type: String

  has_many :products, dependent: :destroy
end

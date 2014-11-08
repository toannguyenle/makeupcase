class User
  include Mongoid::Document
  include Mongoid::Paperclip
  include ActiveModel::SecurePassword
  has_secure_password
  field :name, type: String
  field :username, type: String
  field :email, type: String
  field :agree_marketing, type: Mongoid::Boolean
  field :password_digest, type: String
  field :member_since, type: String
  field :is_public, type: Mongoid::Boolean
  validates_uniqueness_of :email, :username
  has_many :products, dependent: :destroy
  has_many :photos
  has_mongoid_attached_file :avatar,:styles => {
    :thumb    => ['100x100>',   :jpg],
    :square   => ['200x200#',    :jpg]
  }
  validates_attachment_content_type :avatar, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end

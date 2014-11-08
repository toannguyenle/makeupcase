class Photo
  include Mongoid::Document
  include Mongoid::Paperclip

  field :date, type: DateTime

  belongs_to :user
  
  has_mongoid_attached_file :image,
  :styles => {
    :original => ['1920x1680>', :jpg],
    :small    => ['200x200#',   :jpg],
    :thumbnail   => ['100x100#',    :jpg]
  }
  validates_attachment_content_type :image, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]

end
class Category < ActiveRecord::Base
  validates :title, presence: true
  
  has_attached_file :picture, :styles => { small: "150x150>", medium: "300x300>", thumb: "100x100>" },
                  :url  => "/assets/categories/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/categories/:id/:style/:basename.:extension"

  #validates_attachment_presence :picture
  validates_attachment_size :picture, :less_than => 5.megabytes
  validates_attachment_content_type :picture, :content_type => ['image/jpeg', 'image/png']

  has_many :products
end

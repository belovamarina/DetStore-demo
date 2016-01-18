class Product < ActiveRecord::Base
  validates :title, :price, presence: true
  
  has_attached_file :picture, :styles => { small: "150x150>", medium: "300x300>", thumb: "100x100>" },
                  :url  => "/assets/products/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"

  validates_attachment_size :picture, :less_than => 5.megabytes
  validates_attachment_content_type :picture, :content_type => ['image/jpeg', 'image/png']
  belongs_to :category
end

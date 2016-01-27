class Picture < ActiveRecord::Base
  belongs_to :gallery

  has_attached_file :image, :styles => { small: "150x150>", medium: "300x300>", thumb: "100x100>" },
                  :url  => "/assets/galleries/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/galleries/:id/:style/:basename.:extension"

  validates_attachment_size :image, :less_than => 5.megabytes
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']
end
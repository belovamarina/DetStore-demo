class Product < ActiveRecord::Base
  validates :title, :price, presence: true
  
  has_attached_file :picture, :styles => { small: "150x150>", medium: "300x300>", thumb: "100x100>" },
                  :url  => "/assets/products/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"

  validates_attachment_size :picture, :less_than => 5.megabytes
  validates_attachment_content_type :picture, :content_type => ['image/jpeg', 'image/png']
  belongs_to :category

  def self.latest
    Product.order(:updated_at).last
  end


  has_many :line_items
  has_many :orders, through: :line_items

  before_destroy :ensure_not_referenced_by_any_line_item

  private
 # убеждаемся в отсутствии товарных позиций, ссылающихся на данный товар
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'line items exist')
      return false
    end
  end
end

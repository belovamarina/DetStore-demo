class Order < ActiveRecord::Base
  PAYMENT_TYPES = [ "Check", "Credit card", "Purchase order" ]

  validates :name, :address, :phone, :email, presence: true
  validates :pay_type, inclusion: PAYMENT_TYPES

  has_many :line_items, dependent: :destroy
  has_many :products, through: :line_items
  accepts_nested_attributes_for :line_items
  belongs_to :user

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

  def order_total_price
    total = 0
    line_items.each do |i|
      total += i.total_price
    end
    total
  end
end

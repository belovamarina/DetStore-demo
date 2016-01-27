class Gallery < ActiveRecord::Base
  belongs_to :product
  belongs_to :category
  has_many :pictures, :dependent => :destroy
end

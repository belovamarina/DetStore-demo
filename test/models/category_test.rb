require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  fixtures :categories


  test "category attributes must not be empty" do
    # свойства товара не должны оставаться пустыми
    category = Category.new
    assert category.invalid?
    assert category.errors[:title].any?
    #assert category.errors[:picture].any?
  end
end

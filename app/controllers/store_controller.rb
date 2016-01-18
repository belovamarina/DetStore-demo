class StoreController < ApplicationController
  def index
    @categories = Category.all
  end
end

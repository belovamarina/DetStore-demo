require 'test_helper'
include CurrentCart

class LineItemsControllerTest < ActionController::TestCase
  setup do
    @line_item = line_items(:one)
    @request.env['HTTP_REFERER'] = 'http://test.com/orders/1'
  end

  # test "should get index" do
  #   get :index
  #   assert_response :success
  #   assert_not_nil assigns(:line_items)
  # end

  # test "should get new" do
  #   get :new
  #   assert_response :success
  # end

  test "should create line_item" do
    assert_difference('LineItem.count') do
      post :create, product_id: products(:puzzle).id 
    end

    assert_redirected_to cart_path(assigns(:line_item).cart)
  end

  test "should create line_item via ajax" do
    assert_difference('LineItem.count') do
      xhr :post, :create, product_id: products(:puzzle).id
    end
    assert_response :success
  end

  # test "should show line_item" do
  #   get :show, id: @line_item
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get :edit, id: @line_item
  #   assert_response :success
  # end

  test "should update line_item" do
    set_cart
    patch :update, id: @line_item, line_item: { product_id: @line_item.product_id}
    assert_redirected_to :back
  end

  test "should destroy line_item" do
    assert_difference('LineItem.count', -1) do
      delete :destroy, id: @line_item
    end

    assert_redirected_to store_path
  end
end

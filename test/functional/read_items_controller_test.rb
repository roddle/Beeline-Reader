require 'test_helper'

class ReadItemsControllerTest < ActionController::TestCase
  setup do
    @read_item = read_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:read_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create read_item" do
    assert_difference('ReadItem.count') do
      post :create, :read_item => @read_item.attributes
    end

    assert_redirected_to read_item_path(assigns(:read_item))
  end

  test "should show read_item" do
    get :show, :id => @read_item.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @read_item.to_param
    assert_response :success
  end

  test "should update read_item" do
    put :update, :id => @read_item.to_param, :read_item => @read_item.attributes
    assert_redirected_to read_item_path(assigns(:read_item))
  end

  test "should destroy read_item" do
    assert_difference('ReadItem.count', -1) do
      delete :destroy, :id => @read_item.to_param
    end

    assert_redirected_to read_items_path
  end
end

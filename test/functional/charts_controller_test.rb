require 'test_helper'

class ChartsControllerTest < ActionController::TestCase
  setup do
    @chart = charts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:charts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chart" do
    assert_difference('Chart.count') do
      post :create, :chart => @chart.attributes
    end

    assert_redirected_to chart_path(assigns(:chart))
  end

  test "should show chart" do
    get :show, :id => @chart.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @chart.to_param
    assert_response :success
  end

  test "should update chart" do
    put :update, :id => @chart.to_param, :chart => @chart.attributes
    assert_redirected_to chart_path(assigns(:chart))
  end

  test "should destroy chart" do
    assert_difference('Chart.count', -1) do
      session[:chart_id] = @chart.id
      delete :destroy, :id => @chart.to_param
    end

    assert_redirected_to reads_path
  end
end

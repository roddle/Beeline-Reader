require 'test_helper'

class ReadsControllerTest < ActionController::TestCase
  setup do
    @read = reads(:one)
    @update = {
      :name => 'funtional Simple Article',
      :category => 'functional Easy Reading',
      :reading =>
        %{<p>
            functional It should be interesting to see what patterns of reading performance may
            be visible based on what people choose to read, and how familiar they are with
            the topic.
          </p>},
      :poster => 'functional Simple Todd',
      :created_at => DateTime.new(2011,4,7,17),
      :last_read => DateTime.new(2011,5,2,11),
      :word_count => "functional It should be interesting to see what patterns of reading performance may
      be visible based on what people choose to read, and how familiar they are with
      the topic.".scan(/[\w-]+/).size
      :total_reads => 2
    }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create read" do
    assert_difference('Read.count') do
      post :create, :read => @update
    end

    assert_redirected_to read_path(assigns(:read))
  end

  test "should show read" do
    get :show, :id => @read.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @read.to_param
    assert_response :success
  end

  test "should update read" do
    put :update, :id => @read.to_param, :read => @update
    assert_redirected_to read_path(assigns(:read))
  end

  test "should destroy read" do
    assert_difference('Read.count', -1) do
      delete :destroy, :id => @read.to_param
    end

    assert_redirected_to reads_path
  end
end

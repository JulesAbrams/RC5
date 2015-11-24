require 'test_helper'

class Rc5sControllerTest < ActionController::TestCase
  setup do
    @rc5 = rc5s(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rc5s)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rc5" do
    assert_difference('Rc5.count') do
      post :create, rc5: { key: @rc5.key, text: @rc5.text }
    end

    assert_redirected_to rc5_path(assigns(:rc5))
  end

  test "should show rc5" do
    get :show, id: @rc5
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rc5
    assert_response :success
  end

  test "should update rc5" do
    patch :update, id: @rc5, rc5: { key: @rc5.key, text: @rc5.text }
    assert_redirected_to rc5_path(assigns(:rc5))
  end

  test "should destroy rc5" do
    assert_difference('Rc5.count', -1) do
      delete :destroy, id: @rc5
    end

    assert_redirected_to rc5s_path
  end
end

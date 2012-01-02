require 'test_helper'

class FontsetsControllerTest < ActionController::TestCase
  setup do
    @fontset = fontsets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fontsets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fontset" do
    assert_difference('Fontset.count') do
      post :create, fontset: @fontset.attributes
    end

    assert_redirected_to fontset_path(assigns(:fontset))
  end

  test "should show fontset" do
    get :show, id: @fontset.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fontset.to_param
    assert_response :success
  end

  test "should update fontset" do
    put :update, id: @fontset.to_param, fontset: @fontset.attributes
    assert_redirected_to fontset_path(assigns(:fontset))
  end

  test "should destroy fontset" do
    assert_difference('Fontset.count', -1) do
      delete :destroy, id: @fontset.to_param
    end

    assert_redirected_to fontsets_path
  end
end

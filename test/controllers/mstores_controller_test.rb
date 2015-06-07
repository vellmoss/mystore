require 'test_helper'

class MstoresControllerTest < ActionController::TestCase
  setup do
    @mstore = mstores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mstores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mstore" do
    assert_difference('Mstore.count') do
      post :create, mstore: { position: @mstore.position, price: @mstore.price }
    end

    assert_redirected_to mstore_path(assigns(:mstore))
  end

  test "should show mstore" do
    get :show, id: @mstore
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mstore
    assert_response :success
  end

  test "should update mstore" do
    patch :update, id: @mstore, mstore: { position: @mstore.position, price: @mstore.price }
    assert_redirected_to mstore_path(assigns(:mstore))
  end

  test "should destroy mstore" do
    assert_difference('Mstore.count', -1) do
      delete :destroy, id: @mstore
    end

    assert_redirected_to mstores_path
  end
end

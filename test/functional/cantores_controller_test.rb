require 'test_helper'

class CantoresControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cantores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cantor" do
    assert_difference('Cantor.count') do
      post :create, :cantor => { }
    end

    assert_redirected_to cantor_path(assigns(:cantor))
  end

  test "should show cantor" do
    get :show, :id => cantores(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => cantores(:one).to_param
    assert_response :success
  end

  test "should update cantor" do
    put :update, :id => cantores(:one).to_param, :cantor => { }
    assert_redirected_to cantor_path(assigns(:cantor))
  end

  test "should destroy cantor" do
    assert_difference('Cantor.count', -1) do
      delete :destroy, :id => cantores(:one).to_param
    end

    assert_redirected_to cantores_path
  end
end

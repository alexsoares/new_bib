require 'test_helper'

class MidiasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:midias)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create midia" do
    assert_difference('Midia.count') do
      post :create, :midia => { }
    end

    assert_redirected_to midia_path(assigns(:midia))
  end

  test "should show midia" do
    get :show, :id => midias(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => midias(:one).to_param
    assert_response :success
  end

  test "should update midia" do
    put :update, :id => midias(:one).to_param, :midia => { }
    assert_redirected_to midia_path(assigns(:midia))
  end

  test "should destroy midia" do
    assert_difference('Midia.count', -1) do
      delete :destroy, :id => midias(:one).to_param
    end

    assert_redirected_to midias_path
  end
end

require 'test_helper'

class PeriodicosControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Periodicos.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Periodicos.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Periodicos.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to periodicos_url(assigns(:periodicos))
  end

  def test_edit
    get :edit, :id => Periodicos.first
    assert_template 'edit'
  end

  def test_update_invalid
    Periodicos.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Periodicos.first
    assert_template 'edit'
  end

  def test_update_valid
    Periodicos.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Periodicos.first
    assert_redirected_to periodicos_url(assigns(:periodicos))
  end

  def test_destroy
    periodicos = Periodicos.first
    delete :destroy, :id => periodicos
    assert_redirected_to periodicos_url
    assert !Periodicos.exists?(periodicos.id)
  end
end

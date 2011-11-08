require 'test_helper'

class MapasControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Mapas.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Mapas.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Mapas.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to mapas_url(assigns(:mapas))
  end

  def test_edit
    get :edit, :id => Mapas.first
    assert_template 'edit'
  end

  def test_update_invalid
    Mapas.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Mapas.first
    assert_template 'edit'
  end

  def test_update_valid
    Mapas.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Mapas.first
    assert_redirected_to mapas_url(assigns(:mapas))
  end

  def test_destroy
    mapas = Mapas.first
    delete :destroy, :id => mapas
    assert_redirected_to mapas_url
    assert !Mapas.exists?(mapas.id)
  end
end

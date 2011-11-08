require 'test_helper'

class JogosControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Jogos.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Jogos.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Jogos.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to jogos_url(assigns(:jogos))
  end

  def test_edit
    get :edit, :id => Jogos.first
    assert_template 'edit'
  end

  def test_update_invalid
    Jogos.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Jogos.first
    assert_template 'edit'
  end

  def test_update_valid
    Jogos.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Jogos.first
    assert_redirected_to jogos_url(assigns(:jogos))
  end

  def test_destroy
    jogos = Jogos.first
    delete :destroy, :id => jogos
    assert_redirected_to jogos_url
    assert !Jogos.exists?(jogos.id)
  end
end

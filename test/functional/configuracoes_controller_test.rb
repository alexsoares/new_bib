require 'test_helper'

class ConfiguracoesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Configuracao.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Configuracao.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Configuracao.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to configuracao_url(assigns(:configuracao))
  end

  def test_edit
    get :edit, :id => Configuracao.first
    assert_template 'edit'
  end

  def test_update_invalid
    Configuracao.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Configuracao.first
    assert_template 'edit'
  end

  def test_update_valid
    Configuracao.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Configuracao.first
    assert_redirected_to configuracao_url(assigns(:configuracao))
  end

  def test_destroy
    configuracao = Configuracao.first
    delete :destroy, :id => configuracao
    assert_redirected_to configuracaos_url
    assert !Configuracao.exists?(configuracao.id)
  end
end

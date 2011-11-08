require 'test_helper'

class LocalizacoesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Localizacao.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Localizacao.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Localizacao.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to localizacao_url(assigns(:localizacao))
  end

  def test_edit
    get :edit, :id => Localizacao.first
    assert_template 'edit'
  end

  def test_update_invalid
    Localizacao.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Localizacao.first
    assert_template 'edit'
  end

  def test_update_valid
    Localizacao.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Localizacao.first
    assert_redirected_to localizacao_url(assigns(:localizacao))
  end

  def test_destroy
    localizacao = Localizacao.first
    delete :destroy, :id => localizacao
    assert_redirected_to localizacoes_url
    assert !Localizacao.exists?(localizacao.id)
  end
end

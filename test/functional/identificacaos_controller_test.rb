require 'test_helper'

class IdentificacaosControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Identificacao.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Identificacao.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Identificacao.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to identificacao_url(assigns(:identificacao))
  end

  def test_edit
    get :edit, :id => Identificacao.first
    assert_template 'edit'
  end

  def test_update_invalid
    Identificacao.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Identificacao.first
    assert_template 'edit'
  end

  def test_update_valid
    Identificacao.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Identificacao.first
    assert_redirected_to identificacao_url(assigns(:identificacao))
  end

  def test_destroy
    identificacao = Identificacao.first
    delete :destroy, :id => identificacao
    assert_redirected_to identificacaos_url
    assert !Identificacao.exists?(identificacao.id)
  end
end

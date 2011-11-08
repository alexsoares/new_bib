require 'test_helper'

class ItensAssuntosControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => ItensAssunto.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    ItensAssunto.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    ItensAssunto.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to itens_assunto_url(assigns(:itens_assunto))
  end

  def test_edit
    get :edit, :id => ItensAssunto.first
    assert_template 'edit'
  end

  def test_update_invalid
    ItensAssunto.any_instance.stubs(:valid?).returns(false)
    put :update, :id => ItensAssunto.first
    assert_template 'edit'
  end

  def test_update_valid
    ItensAssunto.any_instance.stubs(:valid?).returns(true)
    put :update, :id => ItensAssunto.first
    assert_redirected_to itens_assunto_url(assigns(:itens_assunto))
  end

  def test_destroy
    itens_assunto = ItensAssunto.first
    delete :destroy, :id => itens_assunto
    assert_redirected_to itens_assuntos_url
    assert !ItensAssunto.exists?(itens_assunto.id)
  end
end

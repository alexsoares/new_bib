require 'test_helper'

class AssuntosControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Assunto.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Assunto.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Assunto.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to assunto_url(assigns(:assunto))
  end

  def test_edit
    get :edit, :id => Assunto.first
    assert_template 'edit'
  end

  def test_update_invalid
    Assunto.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Assunto.first
    assert_template 'edit'
  end

  def test_update_valid
    Assunto.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Assunto.first
    assert_redirected_to assunto_url(assigns(:assunto))
  end

  def test_destroy
    assunto = Assunto.first
    delete :destroy, :id => assunto
    assert_redirected_to assuntos_url
    assert !Assunto.exists?(assunto.id)
  end
end

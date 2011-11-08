require 'test_helper'

class UnidadesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Unidade.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Unidade.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Unidade.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to unidade_url(assigns(:unidade))
  end

  def test_edit
    get :edit, :id => Unidade.first
    assert_template 'edit'
  end

  def test_update_invalid
    Unidade.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Unidade.first
    assert_template 'edit'
  end

  def test_update_valid
    Unidade.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Unidade.first
    assert_redirected_to unidade_url(assigns(:unidade))
  end

  def test_destroy
    unidade = Unidade.first
    delete :destroy, :id => unidade
    assert_redirected_to unidades_url
    assert !Unidade.exists?(unidade.id)
  end
end

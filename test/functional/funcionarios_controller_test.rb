require 'test_helper'

class FuncionariosControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Funcionario.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Funcionario.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Funcionario.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to funcionario_url(assigns(:funcionario))
  end

  def test_edit
    get :edit, :id => Funcionario.first
    assert_template 'edit'
  end

  def test_update_invalid
    Funcionario.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Funcionario.first
    assert_template 'edit'
  end

  def test_update_valid
    Funcionario.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Funcionario.first
    assert_redirected_to funcionario_url(assigns(:funcionario))
  end

  def test_destroy
    funcionario = Funcionario.first
    delete :destroy, :id => funcionario
    assert_redirected_to funcionarios_url
    assert !Funcionario.exists?(funcionario.id)
  end
end

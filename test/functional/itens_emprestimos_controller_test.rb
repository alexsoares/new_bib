require 'test_helper'

class ItensEmprestimosControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => ItensEmprestimo.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    ItensEmprestimo.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    ItensEmprestimo.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to itens_emprestimo_url(assigns(:itens_emprestimo))
  end

  def test_edit
    get :edit, :id => ItensEmprestimo.first
    assert_template 'edit'
  end

  def test_update_invalid
    ItensEmprestimo.any_instance.stubs(:valid?).returns(false)
    put :update, :id => ItensEmprestimo.first
    assert_template 'edit'
  end

  def test_update_valid
    ItensEmprestimo.any_instance.stubs(:valid?).returns(true)
    put :update, :id => ItensEmprestimo.first
    assert_redirected_to itens_emprestimo_url(assigns(:itens_emprestimo))
  end

  def test_destroy
    itens_emprestimo = ItensEmprestimo.first
    delete :destroy, :id => itens_emprestimo
    assert_redirected_to itens_emprestimos_url
    assert !ItensEmprestimo.exists?(itens_emprestimo.id)
  end
end

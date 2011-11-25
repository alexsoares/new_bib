require 'test_helper'

class EmprestimosControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Emprestimo.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Emprestimo.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Emprestimo.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to emprestimo_url(assigns(:emprestimo))
  end

  def test_edit
    get :edit, :id => Emprestimo.first
    assert_template 'edit'
  end

  def test_update_invalid
    Emprestimo.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Emprestimo.first
    assert_template 'edit'
  end

  def test_update_valid
    Emprestimo.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Emprestimo.first
    assert_redirected_to emprestimo_url(assigns(:emprestimo))
  end

  def test_destroy
    emprestimo = Emprestimo.first
    delete :destroy, :id => emprestimo
    assert_redirected_to emprestimos_url
    assert !Emprestimo.exists?(emprestimo.id)
  end
end

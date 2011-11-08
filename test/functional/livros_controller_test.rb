require 'test_helper'

class LivrosControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Livro.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Livro.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Livro.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to livro_url(assigns(:livro))
  end

  def test_edit
    get :edit, :id => Livro.first
    assert_template 'edit'
  end

  def test_update_invalid
    Livro.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Livro.first
    assert_template 'edit'
  end

  def test_update_valid
    Livro.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Livro.first
    assert_redirected_to livro_url(assigns(:livro))
  end

  def test_destroy
    livro = Livro.first
    delete :destroy, :id => livro
    assert_redirected_to livros_url
    assert !Livro.exists?(livro.id)
  end
end

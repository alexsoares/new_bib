require 'test_helper'

class AutoresControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Autor.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Autor.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Autor.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to autor_url(assigns(:autor))
  end

  def test_edit
    get :edit, :id => Autor.first
    assert_template 'edit'
  end

  def test_update_invalid
    Autor.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Autor.first
    assert_template 'edit'
  end

  def test_update_valid
    Autor.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Autor.first
    assert_redirected_to autor_url(assigns(:autor))
  end

  def test_destroy
    autor = Autor.first
    delete :destroy, :id => autor
    assert_redirected_to autores_url
    assert !Autor.exists?(autor.id)
  end
end

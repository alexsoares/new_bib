require 'test_helper'

class EditorasControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Editora.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Editora.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Editora.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to editora_url(assigns(:editora))
  end

  def test_edit
    get :edit, :id => Editora.first
    assert_template 'edit'
  end

  def test_update_invalid
    Editora.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Editora.first
    assert_template 'edit'
  end

  def test_update_valid
    Editora.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Editora.first
    assert_redirected_to editora_url(assigns(:editora))
  end

  def test_destroy
    editora = Editora.first
    delete :destroy, :id => editora
    assert_redirected_to editoras_url
    assert !Editora.exists?(editora.id)
  end
end

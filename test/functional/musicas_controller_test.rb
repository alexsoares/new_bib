require 'test_helper'

class MusicasControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Musica.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Musica.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Musica.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to musica_url(assigns(:musica))
  end

  def test_edit
    get :edit, :id => Musica.first
    assert_template 'edit'
  end

  def test_update_invalid
    Musica.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Musica.first
    assert_template 'edit'
  end

  def test_update_valid
    Musica.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Musica.first
    assert_redirected_to musica_url(assigns(:musica))
  end

  def test_destroy
    musica = Musica.first
    delete :destroy, :id => musica
    assert_redirected_to musicas_url
    assert !Musica.exists?(musica.id)
  end
end

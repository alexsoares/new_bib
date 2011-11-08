require 'test_helper'

class DicionarioEnciclopediasControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => DicionarioEnciclopedia.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    DicionarioEnciclopedia.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    DicionarioEnciclopedia.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to dicionario_enciclopedia_url(assigns(:dicionario_enciclopedia))
  end

  def test_edit
    get :edit, :id => DicionarioEnciclopedia.first
    assert_template 'edit'
  end

  def test_update_invalid
    DicionarioEnciclopedia.any_instance.stubs(:valid?).returns(false)
    put :update, :id => DicionarioEnciclopedia.first
    assert_template 'edit'
  end

  def test_update_valid
    DicionarioEnciclopedia.any_instance.stubs(:valid?).returns(true)
    put :update, :id => DicionarioEnciclopedia.first
    assert_redirected_to dicionario_enciclopedia_url(assigns(:dicionario_enciclopedia))
  end

  def test_destroy
    dicionario_enciclopedia = DicionarioEnciclopedia.first
    delete :destroy, :id => dicionario_enciclopedia
    assert_redirected_to dicionario_enciclopedias_url
    assert !DicionarioEnciclopedia.exists?(dicionario_enciclopedia.id)
  end
end

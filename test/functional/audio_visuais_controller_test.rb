require 'test_helper'

class AudioVisuaisControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => AudioVisual.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    AudioVisual.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    AudioVisual.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to audio_visual_url(assigns(:audio_visual))
  end

  def test_edit
    get :edit, :id => AudioVisual.first
    assert_template 'edit'
  end

  def test_update_invalid
    AudioVisual.any_instance.stubs(:valid?).returns(false)
    put :update, :id => AudioVisual.first
    assert_template 'edit'
  end

  def test_update_valid
    AudioVisual.any_instance.stubs(:valid?).returns(true)
    put :update, :id => AudioVisual.first
    assert_redirected_to audio_visual_url(assigns(:audio_visual))
  end

  def test_destroy
    audio_visual = AudioVisual.first
    delete :destroy, :id => audio_visual
    assert_redirected_to audio_visuais_url
    assert !AudioVisual.exists?(audio_visual.id)
  end
end

require 'test_helper'

class MusicNotationThoughtsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => MusicNotationThought.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    MusicNotationThought.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    MusicNotationThought.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to music_notation_thought_url(assigns(:music_notation_thought))
  end
  
  def test_edit
    get :edit, :id => MusicNotationThought.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    MusicNotationThought.any_instance.stubs(:valid?).returns(false)
    put :update, :id => MusicNotationThought.first
    assert_template 'edit'
  end
  
  def test_update_valid
    MusicNotationThought.any_instance.stubs(:valid?).returns(true)
    put :update, :id => MusicNotationThought.first
    assert_redirected_to music_notation_thought_url(assigns(:music_notation_thought))
  end
  
  def test_destroy
    music_notation_thought = MusicNotationThought.first
    delete :destroy, :id => music_notation_thought
    assert_redirected_to music_notation_thoughts_url
    assert !MusicNotationThought.exists?(music_notation_thought.id)
  end
end

require 'test_helper'

class LinksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:links)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create link" do
    assert_difference('Link.count') do
      post :create, :link => { }
    end

    assert_redirected_to link_path(assigns(:link))
  end

  test "should show link" do
    get :show, :id => links(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => links(:one).id
    assert_response :success
  end

  test "should update link" do
    put :update, :id => links(:one).id, :link => { }
    assert_redirected_to link_path(assigns(:link))
  end

  test "should destroy link" do
    assert_difference('Link.count', -1) do
      delete :destroy, :id => links(:one).id
    end

    assert_redirected_to links_path
  end
end

require 'test_helper'

class ArtifactBoxesControllerTest < ActionController::TestCase
  setup do
    @artifact_box = artifact_boxes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:artifact_boxes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create artifact_box" do
    assert_difference('ArtifactBox.count') do
      post :create, artifact_box: {  }
    end

    assert_redirected_to artifact_box_path(assigns(:artifact_box))
  end

  test "should show artifact_box" do
    get :show, id: @artifact_box
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @artifact_box
    assert_response :success
  end

  test "should update artifact_box" do
    patch :update, id: @artifact_box, artifact_box: {  }
    assert_redirected_to artifact_box_path(assigns(:artifact_box))
  end

  test "should destroy artifact_box" do
    assert_difference('ArtifactBox.count', -1) do
      delete :destroy, id: @artifact_box
    end

    assert_redirected_to artifact_boxes_path
  end
end

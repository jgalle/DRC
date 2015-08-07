require 'test_helper'

class ImageSubtypesControllerTest < ActionController::TestCase
  setup do
    @image_subtype = image_subtypes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:image_subtypes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create image_subtype" do
    assert_difference('ImageSubtype.count') do
      post :create, image_subtype: { ImageSubtype: @image_subtype.ImageSubtype }
    end

    assert_redirected_to image_subtype_path(assigns(:image_subtype))
  end

  test "should show image_subtype" do
    get :show, id: @image_subtype
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @image_subtype
    assert_response :success
  end

  test "should update image_subtype" do
    patch :update, id: @image_subtype, image_subtype: { ImageSubtype: @image_subtype.ImageSubtype }
    assert_redirected_to image_subtype_path(assigns(:image_subtype))
  end

  test "should destroy image_subtype" do
    assert_difference('ImageSubtype.count', -1) do
      delete :destroy, id: @image_subtype
    end

    assert_redirected_to image_subtypes_path
  end
end

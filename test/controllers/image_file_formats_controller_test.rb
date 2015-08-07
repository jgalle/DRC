require 'test_helper'

class ImageFileFormatsControllerTest < ActionController::TestCase
  setup do
    @image_file_format = image_file_formats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:image_file_formats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create image_file_format" do
    assert_difference('ImageFileFormat.count') do
      post :create, image_file_format: { ImageFileFormat: @image_file_format.ImageFileFormat }
    end

    assert_redirected_to image_file_format_path(assigns(:image_file_format))
  end

  test "should show image_file_format" do
    get :show, id: @image_file_format
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @image_file_format
    assert_response :success
  end

  test "should update image_file_format" do
    patch :update, id: @image_file_format, image_file_format: { ImageFileFormat: @image_file_format.ImageFileFormat }
    assert_redirected_to image_file_format_path(assigns(:image_file_format))
  end

  test "should destroy image_file_format" do
    assert_difference('ImageFileFormat.count', -1) do
      delete :destroy, id: @image_file_format
    end

    assert_redirected_to image_file_formats_path
  end
end

require 'test_helper'

class ImageFormsControllerTest < ActionController::TestCase
  setup do
    @image_form = image_forms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:image_forms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create image_form" do
    assert_difference('ImageForm.count') do
      post :create, image_form: { ImageForm: @image_form.ImageForm }
    end

    assert_redirected_to image_form_path(assigns(:image_form))
  end

  test "should show image_form" do
    get :show, id: @image_form
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @image_form
    assert_response :success
  end

  test "should update image_form" do
    patch :update, id: @image_form, image_form: { ImageForm: @image_form.ImageForm }
    assert_redirected_to image_form_path(assigns(:image_form))
  end

  test "should destroy image_form" do
    assert_difference('ImageForm.count', -1) do
      delete :destroy, id: @image_form
    end

    assert_redirected_to image_forms_path
  end
end

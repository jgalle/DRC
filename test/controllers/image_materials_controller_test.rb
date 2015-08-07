require 'test_helper'

class ImageMaterialsControllerTest < ActionController::TestCase
  setup do
    @image_material = image_materials(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:image_materials)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create image_material" do
    assert_difference('ImageMaterial.count') do
      post :create, image_material: { ImageMaterial: @image_material.ImageMaterial }
    end

    assert_redirected_to image_material_path(assigns(:image_material))
  end

  test "should show image_material" do
    get :show, id: @image_material
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @image_material
    assert_response :success
  end

  test "should update image_material" do
    patch :update, id: @image_material, image_material: { ImageMaterial: @image_material.ImageMaterial }
    assert_redirected_to image_material_path(assigns(:image_material))
  end

  test "should destroy image_material" do
    assert_difference('ImageMaterial.count', -1) do
      delete :destroy, id: @image_material
    end

    assert_redirected_to image_materials_path
  end
end

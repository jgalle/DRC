require 'test_helper'

class ButtonShapesControllerTest < ActionController::TestCase
  setup do
    @button_shape = button_shapes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:button_shapes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create button_shape" do
    assert_difference('ButtonShape.count') do
      post :create, button_shape: { ButtonShape: @button_shape.ButtonShape }
    end

    assert_redirected_to button_shape_path(assigns(:button_shape))
  end

  test "should show button_shape" do
    get :show, id: @button_shape
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @button_shape
    assert_response :success
  end

  test "should update button_shape" do
    patch :update, id: @button_shape, button_shape: { ButtonShape: @button_shape.ButtonShape }
    assert_redirected_to button_shape_path(assigns(:button_shape))
  end

  test "should destroy button_shape" do
    assert_difference('ButtonShape.count', -1) do
      delete :destroy, id: @button_shape
    end

    assert_redirected_to button_shapes_path
  end
end

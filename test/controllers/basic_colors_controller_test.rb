require 'test_helper'

class BasicColorsControllerTest < ActionController::TestCase
  setup do
    @basic_color = basic_colors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:basic_colors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create basic_color" do
    assert_difference('BasicColor.count') do
      post :create, basic_color: {  }
    end

    assert_redirected_to basic_color_path(assigns(:basic_color))
  end

  test "should show basic_color" do
    get :show, id: @basic_color
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @basic_color
    assert_response :success
  end

  test "should update basic_color" do
    patch :update, id: @basic_color, basic_color: {  }
    assert_redirected_to basic_color_path(assigns(:basic_color))
  end

  test "should destroy basic_color" do
    assert_difference('BasicColor.count', -1) do
      delete :destroy, id: @basic_color
    end

    assert_redirected_to basic_colors_path
  end
end

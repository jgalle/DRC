require 'test_helper'

class ContextSampleLocationsControllerTest < ActionController::TestCase
  setup do
    @context_sample_location = context_sample_locations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:context_sample_locations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create context_sample_location" do
    assert_difference('ContextSampleLocation.count') do
      post :create, context_sample_location: {  }
    end

    assert_redirected_to context_sample_location_path(assigns(:context_sample_location))
  end

  test "should show context_sample_location" do
    get :show, id: @context_sample_location
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @context_sample_location
    assert_response :success
  end

  test "should update context_sample_location" do
    patch :update, id: @context_sample_location, context_sample_location: {  }
    assert_redirected_to context_sample_location_path(assigns(:context_sample_location))
  end

  test "should destroy context_sample_location" do
    assert_difference('ContextSampleLocation.count', -1) do
      delete :destroy, id: @context_sample_location
    end

    assert_redirected_to context_sample_locations_path
  end
end

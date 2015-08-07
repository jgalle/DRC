require 'test_helper'

class ContextSampleStatusesControllerTest < ActionController::TestCase
  setup do
    @context_sample_status = context_sample_statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:context_sample_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create context_sample_status" do
    assert_difference('ContextSampleStatus.count') do
      post :create, context_sample_status: {  }
    end

    assert_redirected_to context_sample_status_path(assigns(:context_sample_status))
  end

  test "should show context_sample_status" do
    get :show, id: @context_sample_status
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @context_sample_status
    assert_response :success
  end

  test "should update context_sample_status" do
    patch :update, id: @context_sample_status, context_sample_status: {  }
    assert_redirected_to context_sample_status_path(assigns(:context_sample_status))
  end

  test "should destroy context_sample_status" do
    assert_difference('ContextSampleStatus.count', -1) do
      delete :destroy, id: @context_sample_status
    end

    assert_redirected_to context_sample_statuses_path
  end
end

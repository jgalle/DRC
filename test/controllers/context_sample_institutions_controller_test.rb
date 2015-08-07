require 'test_helper'

class ContextSampleInstitutionsControllerTest < ActionController::TestCase
  setup do
    @context_sample_institution = context_sample_institutions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:context_sample_institutions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create context_sample_institution" do
    assert_difference('ContextSampleInstitution.count') do
      post :create, context_sample_institution: {  }
    end

    assert_redirected_to context_sample_institution_path(assigns(:context_sample_institution))
  end

  test "should show context_sample_institution" do
    get :show, id: @context_sample_institution
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @context_sample_institution
    assert_response :success
  end

  test "should update context_sample_institution" do
    patch :update, id: @context_sample_institution, context_sample_institution: {  }
    assert_redirected_to context_sample_institution_path(assigns(:context_sample_institution))
  end

  test "should destroy context_sample_institution" do
    assert_difference('ContextSampleInstitution.count', -1) do
      delete :destroy, id: @context_sample_institution
    end

    assert_redirected_to context_sample_institutions_path
  end
end

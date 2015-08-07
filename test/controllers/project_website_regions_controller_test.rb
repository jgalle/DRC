require 'test_helper'

class ProjectWebsiteRegionsControllerTest < ActionController::TestCase
  setup do
    @project_website_region = project_website_regions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:project_website_regions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project_website_region" do
    assert_difference('ProjectWebsiteRegion.count') do
      post :create, project_website_region: {  }
    end

    assert_redirected_to project_website_region_path(assigns(:project_website_region))
  end

  test "should show project_website_region" do
    get :show, id: @project_website_region
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project_website_region
    assert_response :success
  end

  test "should update project_website_region" do
    patch :update, id: @project_website_region, project_website_region: {  }
    assert_redirected_to project_website_region_path(assigns(:project_website_region))
  end

  test "should destroy project_website_region" do
    assert_difference('ProjectWebsiteRegion.count', -1) do
      delete :destroy, id: @project_website_region
    end

    assert_redirected_to project_website_regions_path
  end
end

require 'test_helper'

class WebsiteRegionsControllerTest < ActionController::TestCase
  setup do
    @website_region = website_regions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:website_regions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create website_region" do
    assert_difference('WebsiteRegion.count') do
      post :create, website_region: { WebsiteRegion: @website_region.WebsiteRegion }
    end

    assert_redirected_to website_region_path(assigns(:website_region))
  end

  test "should show website_region" do
    get :show, id: @website_region
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @website_region
    assert_response :success
  end

  test "should update website_region" do
    patch :update, id: @website_region, website_region: { WebsiteRegion: @website_region.WebsiteRegion }
    assert_redirected_to website_region_path(assigns(:website_region))
  end

  test "should destroy website_region" do
    assert_difference('WebsiteRegion.count', -1) do
      delete :destroy, id: @website_region
    end

    assert_redirected_to website_regions_path
  end
end

require 'test_helper'

class CeramicStyElemWaresControllerTest < ActionController::TestCase
  setup do
    @ceramic_sty_elem_ware = ceramic_sty_elem_wares(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ceramic_sty_elem_wares)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ceramic_sty_elem_ware" do
    assert_difference('CeramicStyElemWare.count') do
      post :create, ceramic_sty_elem_ware: {  }
    end

    assert_redirected_to ceramic_sty_elem_ware_path(assigns(:ceramic_sty_elem_ware))
  end

  test "should show ceramic_sty_elem_ware" do
    get :show, id: @ceramic_sty_elem_ware
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ceramic_sty_elem_ware
    assert_response :success
  end

  test "should update ceramic_sty_elem_ware" do
    patch :update, id: @ceramic_sty_elem_ware, ceramic_sty_elem_ware: {  }
    assert_redirected_to ceramic_sty_elem_ware_path(assigns(:ceramic_sty_elem_ware))
  end

  test "should destroy ceramic_sty_elem_ware" do
    assert_difference('CeramicStyElemWare.count', -1) do
      delete :destroy, id: @ceramic_sty_elem_ware
    end

    assert_redirected_to ceramic_sty_elem_wares_path
  end
end

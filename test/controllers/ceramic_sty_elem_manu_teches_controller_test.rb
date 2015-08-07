require 'test_helper'

class CeramicStyElemManuTechesControllerTest < ActionController::TestCase
  setup do
    @ceramic_sty_elem_manu_tech = ceramic_sty_elem_manu_teches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ceramic_sty_elem_manu_teches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ceramic_sty_elem_manu_tech" do
    assert_difference('CeramicStyElemManuTech.count') do
      post :create, ceramic_sty_elem_manu_tech: {  }
    end

    assert_redirected_to ceramic_sty_elem_manu_tech_path(assigns(:ceramic_sty_elem_manu_tech))
  end

  test "should show ceramic_sty_elem_manu_tech" do
    get :show, id: @ceramic_sty_elem_manu_tech
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ceramic_sty_elem_manu_tech
    assert_response :success
  end

  test "should update ceramic_sty_elem_manu_tech" do
    patch :update, id: @ceramic_sty_elem_manu_tech, ceramic_sty_elem_manu_tech: {  }
    assert_redirected_to ceramic_sty_elem_manu_tech_path(assigns(:ceramic_sty_elem_manu_tech))
  end

  test "should destroy ceramic_sty_elem_manu_tech" do
    assert_difference('CeramicStyElemManuTech.count', -1) do
      delete :destroy, id: @ceramic_sty_elem_manu_tech
    end

    assert_redirected_to ceramic_sty_elem_manu_teches_path
  end
end

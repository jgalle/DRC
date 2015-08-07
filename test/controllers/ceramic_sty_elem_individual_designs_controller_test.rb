require 'test_helper'

class CeramicStyElemIndividualDesignsControllerTest < ActionController::TestCase
  setup do
    @ceramic_sty_elem_individual_design = ceramic_sty_elem_individual_designs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ceramic_sty_elem_individual_designs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ceramic_sty_elem_individual_design" do
    assert_difference('CeramicStyElemIndividualDesign.count') do
      post :create, ceramic_sty_elem_individual_design: {  }
    end

    assert_redirected_to ceramic_sty_elem_individual_design_path(assigns(:ceramic_sty_elem_individual_design))
  end

  test "should show ceramic_sty_elem_individual_design" do
    get :show, id: @ceramic_sty_elem_individual_design
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ceramic_sty_elem_individual_design
    assert_response :success
  end

  test "should update ceramic_sty_elem_individual_design" do
    patch :update, id: @ceramic_sty_elem_individual_design, ceramic_sty_elem_individual_design: {  }
    assert_redirected_to ceramic_sty_elem_individual_design_path(assigns(:ceramic_sty_elem_individual_design))
  end

  test "should destroy ceramic_sty_elem_individual_design" do
    assert_difference('CeramicStyElemIndividualDesign.count', -1) do
      delete :destroy, id: @ceramic_sty_elem_individual_design
    end

    assert_redirected_to ceramic_sty_elem_individual_designs_path
  end
end

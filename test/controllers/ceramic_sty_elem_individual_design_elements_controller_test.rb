require 'test_helper'

class CeramicStyElemIndividualDesignElementsControllerTest < ActionController::TestCase
  setup do
    @ceramic_sty_elem_individual_design_element = ceramic_sty_elem_individual_design_elements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ceramic_sty_elem_individual_design_elements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ceramic_sty_elem_individual_design_element" do
    assert_difference('CeramicStyElemIndividualDesignElement.count') do
      post :create, ceramic_sty_elem_individual_design_element: {  }
    end

    assert_redirected_to ceramic_sty_elem_individual_design_element_path(assigns(:ceramic_sty_elem_individual_design_element))
  end

  test "should show ceramic_sty_elem_individual_design_element" do
    get :show, id: @ceramic_sty_elem_individual_design_element
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ceramic_sty_elem_individual_design_element
    assert_response :success
  end

  test "should update ceramic_sty_elem_individual_design_element" do
    patch :update, id: @ceramic_sty_elem_individual_design_element, ceramic_sty_elem_individual_design_element: {  }
    assert_redirected_to ceramic_sty_elem_individual_design_element_path(assigns(:ceramic_sty_elem_individual_design_element))
  end

  test "should destroy ceramic_sty_elem_individual_design_element" do
    assert_difference('CeramicStyElemIndividualDesignElement.count', -1) do
      delete :destroy, id: @ceramic_sty_elem_individual_design_element
    end

    assert_redirected_to ceramic_sty_elem_individual_design_elements_path
  end
end

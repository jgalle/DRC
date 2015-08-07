require 'test_helper'

class CeramicStyElemDecTechesControllerTest < ActionController::TestCase
  setup do
    @ceramic_sty_elem_dec_tech = ceramic_sty_elem_dec_teches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ceramic_sty_elem_dec_teches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ceramic_sty_elem_dec_tech" do
    assert_difference('CeramicStyElemDecTech.count') do
      post :create, ceramic_sty_elem_dec_tech: {  }
    end

    assert_redirected_to ceramic_sty_elem_dec_tech_path(assigns(:ceramic_sty_elem_dec_tech))
  end

  test "should show ceramic_sty_elem_dec_tech" do
    get :show, id: @ceramic_sty_elem_dec_tech
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ceramic_sty_elem_dec_tech
    assert_response :success
  end

  test "should update ceramic_sty_elem_dec_tech" do
    patch :update, id: @ceramic_sty_elem_dec_tech, ceramic_sty_elem_dec_tech: {  }
    assert_redirected_to ceramic_sty_elem_dec_tech_path(assigns(:ceramic_sty_elem_dec_tech))
  end

  test "should destroy ceramic_sty_elem_dec_tech" do
    assert_difference('CeramicStyElemDecTech.count', -1) do
      delete :destroy, id: @ceramic_sty_elem_dec_tech
    end

    assert_redirected_to ceramic_sty_elem_dec_teches_path
  end
end

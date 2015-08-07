require 'test_helper'

class CeramicStyElemMetaDataControllerTest < ActionController::TestCase
  setup do
    @ceramic_sty_elem_meta_datum = ceramic_sty_elem_meta_data(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ceramic_sty_elem_meta_data)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ceramic_sty_elem_meta_datum" do
    assert_difference('CeramicStyElemMetaDatum.count') do
      post :create, ceramic_sty_elem_meta_datum: {  }
    end

    assert_redirected_to ceramic_sty_elem_meta_datum_path(assigns(:ceramic_sty_elem_meta_datum))
  end

  test "should show ceramic_sty_elem_meta_datum" do
    get :show, id: @ceramic_sty_elem_meta_datum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ceramic_sty_elem_meta_datum
    assert_response :success
  end

  test "should update ceramic_sty_elem_meta_datum" do
    patch :update, id: @ceramic_sty_elem_meta_datum, ceramic_sty_elem_meta_datum: {  }
    assert_redirected_to ceramic_sty_elem_meta_datum_path(assigns(:ceramic_sty_elem_meta_datum))
  end

  test "should destroy ceramic_sty_elem_meta_datum" do
    assert_difference('CeramicStyElemMetaDatum.count', -1) do
      delete :destroy, id: @ceramic_sty_elem_meta_datum
    end

    assert_redirected_to ceramic_sty_elem_meta_data_path
  end
end

require 'test_helper'

class CeramicStyElemGenresControllerTest < ActionController::TestCase
  setup do
    @ceramic_sty_elem_genre = ceramic_sty_elem_genres(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ceramic_sty_elem_genres)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ceramic_sty_elem_genre" do
    assert_difference('CeramicStyElemGenre.count') do
      post :create, ceramic_sty_elem_genre: {  }
    end

    assert_redirected_to ceramic_sty_elem_genre_path(assigns(:ceramic_sty_elem_genre))
  end

  test "should show ceramic_sty_elem_genre" do
    get :show, id: @ceramic_sty_elem_genre
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ceramic_sty_elem_genre
    assert_response :success
  end

  test "should update ceramic_sty_elem_genre" do
    patch :update, id: @ceramic_sty_elem_genre, ceramic_sty_elem_genre: {  }
    assert_redirected_to ceramic_sty_elem_genre_path(assigns(:ceramic_sty_elem_genre))
  end

  test "should destroy ceramic_sty_elem_genre" do
    assert_difference('CeramicStyElemGenre.count', -1) do
      delete :destroy, id: @ceramic_sty_elem_genre
    end

    assert_redirected_to ceramic_sty_elem_genres_path
  end
end

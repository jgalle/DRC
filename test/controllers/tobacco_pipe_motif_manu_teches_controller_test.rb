require 'test_helper'

class TobaccoPipeMotifManuTechesControllerTest < ActionController::TestCase
  setup do
    @tobacco_pipe_motif_manu_tech = tobacco_pipe_motif_manu_teches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tobacco_pipe_motif_manu_teches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tobacco_pipe_motif_manu_tech" do
    assert_difference('TobaccoPipeMotifManuTech.count') do
      post :create, tobacco_pipe_motif_manu_tech: { MotifManuTech: @tobacco_pipe_motif_manu_tech.MotifManuTech }
    end

    assert_redirected_to tobacco_pipe_motif_manu_tech_path(assigns(:tobacco_pipe_motif_manu_tech))
  end

  test "should show tobacco_pipe_motif_manu_tech" do
    get :show, id: @tobacco_pipe_motif_manu_tech
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tobacco_pipe_motif_manu_tech
    assert_response :success
  end

  test "should update tobacco_pipe_motif_manu_tech" do
    patch :update, id: @tobacco_pipe_motif_manu_tech, tobacco_pipe_motif_manu_tech: { MotifManuTech: @tobacco_pipe_motif_manu_tech.MotifManuTech }
    assert_redirected_to tobacco_pipe_motif_manu_tech_path(assigns(:tobacco_pipe_motif_manu_tech))
  end

  test "should destroy tobacco_pipe_motif_manu_tech" do
    assert_difference('TobaccoPipeMotifManuTech.count', -1) do
      delete :destroy, id: @tobacco_pipe_motif_manu_tech
    end

    assert_redirected_to tobacco_pipe_motif_manu_teches_path
  end
end

require 'test_helper'

class FormularyProfileClassifiesControllerTest < ActionController::TestCase
  setup do
    @formulary_profile_classify = formulary_profile_classifies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:formulary_profile_classifies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create formulary_profile_classify" do
    assert_difference('FormularyProfileClassify.count') do
      post :create, formulary_profile_classify: { entire_program: @formulary_profile_classify.entire_program, other: @formulary_profile_classify.other, part_program: @formulary_profile_classify.part_program, project: @formulary_profile_classify.project, which: @formulary_profile_classify.which }
    end

    assert_redirected_to formulary_profile_classify_path(assigns(:formulary_profile_classify))
  end

  test "should show formulary_profile_classify" do
    get :show, id: @formulary_profile_classify
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @formulary_profile_classify
    assert_response :success
  end

  test "should update formulary_profile_classify" do
    patch :update, id: @formulary_profile_classify, formulary_profile_classify: { entire_program: @formulary_profile_classify.entire_program, other: @formulary_profile_classify.other, part_program: @formulary_profile_classify.part_program, project: @formulary_profile_classify.project, which: @formulary_profile_classify.which }
    assert_redirected_to formulary_profile_classify_path(assigns(:formulary_profile_classify))
  end

  test "should destroy formulary_profile_classify" do
    assert_difference('FormularyProfileClassify.count', -1) do
      delete :destroy, id: @formulary_profile_classify
    end

    assert_redirected_to formulary_profile_classifies_path
  end
end

require 'test_helper'

class FormularyProfileReachesControllerTest < ActionController::TestCase
  setup do
    @formulary_profile_reach = formulary_profile_reaches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:formulary_profile_reaches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create formulary_profile_reach" do
    assert_difference('FormularyProfileReach.count') do
      post :create, formulary_profile_reach: { action: @formulary_profile_reach.action, policy: @formulary_profile_reach.policy, research: @formulary_profile_reach.research }
    end

    assert_redirected_to formulary_profile_reach_path(assigns(:formulary_profile_reach))
  end

  test "should show formulary_profile_reach" do
    get :show, id: @formulary_profile_reach
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @formulary_profile_reach
    assert_response :success
  end

  test "should update formulary_profile_reach" do
    patch :update, id: @formulary_profile_reach, formulary_profile_reach: { action: @formulary_profile_reach.action, policy: @formulary_profile_reach.policy, research: @formulary_profile_reach.research }
    assert_redirected_to formulary_profile_reach_path(assigns(:formulary_profile_reach))
  end

  test "should destroy formulary_profile_reach" do
    assert_difference('FormularyProfileReach.count', -1) do
      delete :destroy, id: @formulary_profile_reach
    end

    assert_redirected_to formulary_profile_reaches_path
  end
end

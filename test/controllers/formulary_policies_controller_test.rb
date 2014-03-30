require 'test_helper'

class FormularyPoliciesControllerTest < ActionController::TestCase
  setup do
    @formulary_policy = formulary_policies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:formulary_policies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create formulary_policy" do
    assert_difference('FormularyPolicy.count') do
      post :create, formulary_policy: { actor_strategies: @formulary_policy.actor_strategies, formulary_id: @formulary_policy.formulary_id, improve_policies: @formulary_policy.improve_policies, improve_strategies: @formulary_policy.improve_strategies, intersectoral_design: @formulary_policy.intersectoral_design, multiple_kind: @formulary_policy.multiple_kind, multiple_kind_name: @formulary_policy.multiple_kind_name, other: @formulary_policy.other, other_description: @formulary_policy.other_description, prevent_strategies: @formulary_policy.prevent_strategies, project_result: @formulary_policy.project_result }
    end

    assert_redirected_to formulary_policy_path(assigns(:formulary_policy))
  end

  test "should show formulary_policy" do
    get :show, id: @formulary_policy
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @formulary_policy
    assert_response :success
  end

  test "should update formulary_policy" do
    patch :update, id: @formulary_policy, formulary_policy: { actor_strategies: @formulary_policy.actor_strategies, formulary_id: @formulary_policy.formulary_id, improve_policies: @formulary_policy.improve_policies, improve_strategies: @formulary_policy.improve_strategies, intersectoral_design: @formulary_policy.intersectoral_design, multiple_kind: @formulary_policy.multiple_kind, multiple_kind_name: @formulary_policy.multiple_kind_name, other: @formulary_policy.other, other_description: @formulary_policy.other_description, prevent_strategies: @formulary_policy.prevent_strategies, project_result: @formulary_policy.project_result }
    assert_redirected_to formulary_policy_path(assigns(:formulary_policy))
  end

  test "should destroy formulary_policy" do
    assert_difference('FormularyPolicy.count', -1) do
      delete :destroy, id: @formulary_policy
    end

    assert_redirected_to formulary_policies_path
  end
end

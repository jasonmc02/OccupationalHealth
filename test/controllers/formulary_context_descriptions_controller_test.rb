require 'test_helper'

class FormularyContextDescriptionsControllerTest < ActionController::TestCase
  setup do
    @formulary_context_description = formulary_context_descriptions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:formulary_context_descriptions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create formulary_context_description" do
    assert_difference('FormularyContextDescription.count') do
      post :create, formulary_context_description: { community_participation: @formulary_context_description.community_participation, complexity: @formulary_context_description.complexity, equity: @formulary_context_description.equity, formulary_context_id: @formulary_context_description.formulary_context_id, gender: @formulary_context_description.gender, other: @formulary_context_description.other, policy: @formulary_context_description.policy, project_term: @formulary_context_description.project_term, require_integration: @formulary_context_description.require_integration, require_integration_name: @formulary_context_description.require_integration_name }
    end

    assert_redirected_to formulary_context_description_path(assigns(:formulary_context_description))
  end

  test "should show formulary_context_description" do
    get :show, id: @formulary_context_description
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @formulary_context_description
    assert_response :success
  end

  test "should update formulary_context_description" do
    patch :update, id: @formulary_context_description, formulary_context_description: { community_participation: @formulary_context_description.community_participation, complexity: @formulary_context_description.complexity, equity: @formulary_context_description.equity, formulary_context_id: @formulary_context_description.formulary_context_id, gender: @formulary_context_description.gender, other: @formulary_context_description.other, policy: @formulary_context_description.policy, project_term: @formulary_context_description.project_term, require_integration: @formulary_context_description.require_integration, require_integration_name: @formulary_context_description.require_integration_name }
    assert_redirected_to formulary_context_description_path(assigns(:formulary_context_description))
  end

  test "should destroy formulary_context_description" do
    assert_difference('FormularyContextDescription.count', -1) do
      delete :destroy, id: @formulary_context_description
    end

    assert_redirected_to formulary_context_descriptions_path
  end
end

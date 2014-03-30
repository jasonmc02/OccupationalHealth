require 'test_helper'

class FormularyContextsControllerTest < ActionController::TestCase
  setup do
    @formulary_context = formulary_contexts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:formulary_contexts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create formulary_context" do
    assert_difference('FormularyContext.count') do
      post :create, formulary_context: { formulary_profile_id: @formulary_context.formulary_profile_id, intersectoral_aspect: @formulary_context.intersectoral_aspect, intersectoral_aspect_name: @formulary_context.intersectoral_aspect_name, key_actors: @formulary_context.key_actors, local_context: @formulary_context.local_context, local_context_name: @formulary_context.local_context_name, political_jurisdiction: @formulary_context.political_jurisdiction, political_jurisdictions_name: @formulary_context.political_jurisdictions_name, project_affect: @formulary_context.project_affect, project_affect_name: @formulary_context.project_affect_name, role_consideration: @formulary_context.role_consideration, role_consideration_name: @formulary_context.role_consideration_name, scale_description: @formulary_context.scale_description, sociopolitical_context: @formulary_context.sociopolitical_context, success_considerantion_name: @formulary_context.success_considerantion_name, success_consideration: @formulary_context.success_consideration }
    end

    assert_redirected_to formulary_context_path(assigns(:formulary_context))
  end

  test "should show formulary_context" do
    get :show, id: @formulary_context
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @formulary_context
    assert_response :success
  end

  test "should update formulary_context" do
    patch :update, id: @formulary_context, formulary_context: { formulary_profile_id: @formulary_context.formulary_profile_id, intersectoral_aspect: @formulary_context.intersectoral_aspect, intersectoral_aspect_name: @formulary_context.intersectoral_aspect_name, key_actors: @formulary_context.key_actors, local_context: @formulary_context.local_context, local_context_name: @formulary_context.local_context_name, political_jurisdiction: @formulary_context.political_jurisdiction, political_jurisdictions_name: @formulary_context.political_jurisdictions_name, project_affect: @formulary_context.project_affect, project_affect_name: @formulary_context.project_affect_name, role_consideration: @formulary_context.role_consideration, role_consideration_name: @formulary_context.role_consideration_name, scale_description: @formulary_context.scale_description, sociopolitical_context: @formulary_context.sociopolitical_context, success_considerantion_name: @formulary_context.success_considerantion_name, success_consideration: @formulary_context.success_consideration }
    assert_redirected_to formulary_context_path(assigns(:formulary_context))
  end

  test "should destroy formulary_context" do
    assert_difference('FormularyContext.count', -1) do
      delete :destroy, id: @formulary_context
    end

    assert_redirected_to formulary_contexts_path
  end
end

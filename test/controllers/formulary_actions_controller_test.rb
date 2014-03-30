require 'test_helper'

class FormularyActionsControllerTest < ActionController::TestCase
  setup do
    @formulary_action = formulary_actions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:formulary_actions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create formulary_action" do
    assert_difference('FormularyAction.count') do
      post :create, formulary_action: { business: @formulary_action.business, church: @formulary_action.church, community_group: @formulary_action.community_group, community_leader: @formulary_action.community_leader, decision_maker: @formulary_action.decision_maker, develop_understanding: @formulary_action.develop_understanding, enhancing_participation: @formulary_action.enhancing_participation, entire_process: @formulary_action.entire_process, factor_affects: @formulary_action.factor_affects, factor_affects_name: @formulary_action.factor_affects_name, global: @formulary_action.global, implement: @formulary_action.implement, implement_description: @formulary_action.implement_description, improving_communication: @formulary_action.improving_communication, including_actor: @formulary_action.including_actor, influence: @formulary_action.influence, inlfuence_description: @formulary_action.inlfuence_description, international: @formulary_action.international, local: @formulary_action.local, municipal: @formulary_action.municipal, national: @formulary_action.national, national: @formulary_action.national, new_methodologies: @formulary_action.new_methodologies, new_methodologies_description: @formulary_action.new_methodologies_description, ngos: @formulary_action.ngos, none: @formulary_action.none, none: @formulary_action.none, not_participatory_process: @formulary_action.not_participatory_process, other: @formulary_action.other, other: @formulary_action.other, other: @formulary_action.other, other_incorporation: @formulary_action.other_incorporation, other_incorporation_description: @formulary_action.other_incorporation_description, other_research_group: @formulary_action.other_research_group, regiona: @formulary_action.regiona, regional: @formulary_action.regional, research_part: @formulary_action.research_part }
    end

    assert_redirected_to formulary_action_path(assigns(:formulary_action))
  end

  test "should show formulary_action" do
    get :show, id: @formulary_action
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @formulary_action
    assert_response :success
  end

  test "should update formulary_action" do
    patch :update, id: @formulary_action, formulary_action: { business: @formulary_action.business, church: @formulary_action.church, community_group: @formulary_action.community_group, community_leader: @formulary_action.community_leader, decision_maker: @formulary_action.decision_maker, develop_understanding: @formulary_action.develop_understanding, enhancing_participation: @formulary_action.enhancing_participation, entire_process: @formulary_action.entire_process, factor_affects: @formulary_action.factor_affects, factor_affects_name: @formulary_action.factor_affects_name, global: @formulary_action.global, implement: @formulary_action.implement, implement_description: @formulary_action.implement_description, improving_communication: @formulary_action.improving_communication, including_actor: @formulary_action.including_actor, influence: @formulary_action.influence, inlfuence_description: @formulary_action.inlfuence_description, international: @formulary_action.international, local: @formulary_action.local, municipal: @formulary_action.municipal, national: @formulary_action.national, national: @formulary_action.national, new_methodologies: @formulary_action.new_methodologies, new_methodologies_description: @formulary_action.new_methodologies_description, ngos: @formulary_action.ngos, none: @formulary_action.none, none: @formulary_action.none, not_participatory_process: @formulary_action.not_participatory_process, other: @formulary_action.other, other: @formulary_action.other, other: @formulary_action.other, other_incorporation: @formulary_action.other_incorporation, other_incorporation_description: @formulary_action.other_incorporation_description, other_research_group: @formulary_action.other_research_group, regiona: @formulary_action.regiona, regional: @formulary_action.regional, research_part: @formulary_action.research_part }
    assert_redirected_to formulary_action_path(assigns(:formulary_action))
  end

  test "should destroy formulary_action" do
    assert_difference('FormularyAction.count', -1) do
      delete :destroy, id: @formulary_action
    end

    assert_redirected_to formulary_actions_path
  end
end

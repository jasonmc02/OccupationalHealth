require 'test_helper'

class FormularyResearchesControllerTest < ActionController::TestCase
  setup do
    @formulary_research = formulary_researches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:formulary_researches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create formulary_research" do
    assert_difference('FormularyResearch.count') do
      post :create, formulary_research: { formulary_id: @formulary_research.formulary_id, generate_knowledge: @formulary_research.generate_knowledge, influencing_legislation: @formulary_research.influencing_legislation, inlcude_actor: @formulary_research.inlcude_actor, integrate_investigation: @formulary_research.integrate_investigation, integrate_investigation_no: @formulary_research.integrate_investigation_no, integtrate_investigation_yes: @formulary_research.integtrate_investigation_yes, interaction: @formulary_research.interaction, interaction_name: @formulary_research.interaction_name, no_impact: @formulary_research.no_impact, other: @formulary_research.other, test_hypothesis: @formulary_research.test_hypothesis, translate_knowledge: @formulary_research.translate_knowledge }
    end

    assert_redirected_to formulary_research_path(assigns(:formulary_research))
  end

  test "should show formulary_research" do
    get :show, id: @formulary_research
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @formulary_research
    assert_response :success
  end

  test "should update formulary_research" do
    patch :update, id: @formulary_research, formulary_research: { formulary_id: @formulary_research.formulary_id, generate_knowledge: @formulary_research.generate_knowledge, influencing_legislation: @formulary_research.influencing_legislation, inlcude_actor: @formulary_research.inlcude_actor, integrate_investigation: @formulary_research.integrate_investigation, integrate_investigation_no: @formulary_research.integrate_investigation_no, integtrate_investigation_yes: @formulary_research.integtrate_investigation_yes, interaction: @formulary_research.interaction, interaction_name: @formulary_research.interaction_name, no_impact: @formulary_research.no_impact, other: @formulary_research.other, test_hypothesis: @formulary_research.test_hypothesis, translate_knowledge: @formulary_research.translate_knowledge }
    assert_redirected_to formulary_research_path(assigns(:formulary_research))
  end

  test "should destroy formulary_research" do
    assert_difference('FormularyResearch.count', -1) do
      delete :destroy, id: @formulary_research
    end

    assert_redirected_to formulary_researches_path
  end
end

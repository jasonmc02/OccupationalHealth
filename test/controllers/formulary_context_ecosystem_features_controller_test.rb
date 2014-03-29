require 'test_helper'

class FormularyContextEcosystemFeaturesControllerTest < ActionController::TestCase
  setup do
    @formulary_context_ecosystem_feature = formulary_context_ecosystem_features(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:formulary_context_ecosystem_features)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create formulary_context_ecosystem_feature" do
    assert_difference('FormularyContextEcosystemFeature.count') do
      post :create, formulary_context_ecosystem_feature: { agricultural: @formulary_context_ecosystem_feature.agricultural, climate_effect: @formulary_context_ecosystem_feature.climate_effect, cloud_forest: @formulary_context_ecosystem_feature.cloud_forest, coastal: @formulary_context_ecosystem_feature.coastal, desert: @formulary_context_ecosystem_feature.desert, disrupted: @formulary_context_ecosystem_feature.disrupted, dry_forest: @formulary_context_ecosystem_feature.dry_forest, environmental_degradation: @formulary_context_ecosystem_feature.environmental_degradation, forest: @formulary_context_ecosystem_feature.forest, formulary_context_id: @formulary_context_ecosystem_feature.formulary_context_id, mixed_forest: @formulary_context_ecosystem_feature.mixed_forest, natural_force: @formulary_context_ecosystem_feature.natural_force, old_growth_forest: @formulary_context_ecosystem_feature.old_growth_forest, other: @formulary_context_ecosystem_feature.other, rainfores: @formulary_context_ecosystem_feature.rainfores, resource_extraction: @formulary_context_ecosystem_feature.resource_extraction, rural: @formulary_context_ecosystem_feature.rural, semiurban: @formulary_context_ecosystem_feature.semiurban, urban: @formulary_context_ecosystem_feature.urban, watershed: @formulary_context_ecosystem_feature.watershed, watersheed_name: @formulary_context_ecosystem_feature.watersheed_name, wetland: @formulary_context_ecosystem_feature.wetland, wilderness: @formulary_context_ecosystem_feature.wilderness }
    end

    assert_redirected_to formulary_context_ecosystem_feature_path(assigns(:formulary_context_ecosystem_feature))
  end

  test "should show formulary_context_ecosystem_feature" do
    get :show, id: @formulary_context_ecosystem_feature
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @formulary_context_ecosystem_feature
    assert_response :success
  end

  test "should update formulary_context_ecosystem_feature" do
    patch :update, id: @formulary_context_ecosystem_feature, formulary_context_ecosystem_feature: { agricultural: @formulary_context_ecosystem_feature.agricultural, climate_effect: @formulary_context_ecosystem_feature.climate_effect, cloud_forest: @formulary_context_ecosystem_feature.cloud_forest, coastal: @formulary_context_ecosystem_feature.coastal, desert: @formulary_context_ecosystem_feature.desert, disrupted: @formulary_context_ecosystem_feature.disrupted, dry_forest: @formulary_context_ecosystem_feature.dry_forest, environmental_degradation: @formulary_context_ecosystem_feature.environmental_degradation, forest: @formulary_context_ecosystem_feature.forest, formulary_context_id: @formulary_context_ecosystem_feature.formulary_context_id, mixed_forest: @formulary_context_ecosystem_feature.mixed_forest, natural_force: @formulary_context_ecosystem_feature.natural_force, old_growth_forest: @formulary_context_ecosystem_feature.old_growth_forest, other: @formulary_context_ecosystem_feature.other, rainfores: @formulary_context_ecosystem_feature.rainfores, resource_extraction: @formulary_context_ecosystem_feature.resource_extraction, rural: @formulary_context_ecosystem_feature.rural, semiurban: @formulary_context_ecosystem_feature.semiurban, urban: @formulary_context_ecosystem_feature.urban, watershed: @formulary_context_ecosystem_feature.watershed, watersheed_name: @formulary_context_ecosystem_feature.watersheed_name, wetland: @formulary_context_ecosystem_feature.wetland, wilderness: @formulary_context_ecosystem_feature.wilderness }
    assert_redirected_to formulary_context_ecosystem_feature_path(assigns(:formulary_context_ecosystem_feature))
  end

  test "should destroy formulary_context_ecosystem_feature" do
    assert_difference('FormularyContextEcosystemFeature.count', -1) do
      delete :destroy, id: @formulary_context_ecosystem_feature
    end

    assert_redirected_to formulary_context_ecosystem_features_path
  end
end

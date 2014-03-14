require 'test_helper'

class FormularyProfileAreasControllerTest < ActionController::TestCase
  setup do
    @formulary_profile_area = formulary_profile_areas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:formulary_profile_areas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create formulary_profile_area" do
    assert_difference('FormularyProfileArea.count') do
      post :create, formulary_profile_area: { animal_health: @formulary_profile_area.animal_health, climate_change: @formulary_profile_area.climate_change, community_paticipation: @formulary_profile_area.community_paticipation, determinant_of_health: @formulary_profile_area.determinant_of_health, food_sovereignty: @formulary_profile_area.food_sovereignty, forest_management: @formulary_profile_area.forest_management, indigenous_health: @formulary_profile_area.indigenous_health, mining: @formulary_profile_area.mining, occupational_health: @formulary_profile_area.occupational_health, other: @formulary_profile_area.other, pesticide: @formulary_profile_area.pesticide, public_health: @formulary_profile_area.public_health, solid_waste_management: @formulary_profile_area.solid_waste_management, watershed_management: @formulary_profile_area.watershed_management }
    end

    assert_redirected_to formulary_profile_area_path(assigns(:formulary_profile_area))
  end

  test "should show formulary_profile_area" do
    get :show, id: @formulary_profile_area
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @formulary_profile_area
    assert_response :success
  end

  test "should update formulary_profile_area" do
    patch :update, id: @formulary_profile_area, formulary_profile_area: { animal_health: @formulary_profile_area.animal_health, climate_change: @formulary_profile_area.climate_change, community_paticipation: @formulary_profile_area.community_paticipation, determinant_of_health: @formulary_profile_area.determinant_of_health, food_sovereignty: @formulary_profile_area.food_sovereignty, forest_management: @formulary_profile_area.forest_management, indigenous_health: @formulary_profile_area.indigenous_health, mining: @formulary_profile_area.mining, occupational_health: @formulary_profile_area.occupational_health, other: @formulary_profile_area.other, pesticide: @formulary_profile_area.pesticide, public_health: @formulary_profile_area.public_health, solid_waste_management: @formulary_profile_area.solid_waste_management, watershed_management: @formulary_profile_area.watershed_management }
    assert_redirected_to formulary_profile_area_path(assigns(:formulary_profile_area))
  end

  test "should destroy formulary_profile_area" do
    assert_difference('FormularyProfileArea.count', -1) do
      delete :destroy, id: @formulary_profile_area
    end

    assert_redirected_to formulary_profile_areas_path
  end
end

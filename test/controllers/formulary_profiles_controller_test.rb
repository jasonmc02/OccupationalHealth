require 'test_helper'

class FormularyProfilesControllerTest < ActionController::TestCase
  setup do
    @formulary_profile = formulary_profiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:formulary_profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create formulary_profile" do
    assert_difference('FormularyProfile.count') do
      post :create, formulary_profile: { description: @formulary_profile.description, discipline: @formulary_profile.discipline, institution: @formulary_profile.institution, name: @formulary_profile.name, objective: @formulary_profile.objective, period: @formulary_profile.period, region: @formulary_profile.region, success: @formulary_profile.success }
    end

    assert_redirected_to formulary_profile_path(assigns(:formulary_profile))
  end

  test "should show formulary_profile" do
    get :show, id: @formulary_profile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @formulary_profile
    assert_response :success
  end

  test "should update formulary_profile" do
    patch :update, id: @formulary_profile, formulary_profile: { description: @formulary_profile.description, discipline: @formulary_profile.discipline, institution: @formulary_profile.institution, name: @formulary_profile.name, objective: @formulary_profile.objective, period: @formulary_profile.period, region: @formulary_profile.region, success: @formulary_profile.success }
    assert_redirected_to formulary_profile_path(assigns(:formulary_profile))
  end

  test "should destroy formulary_profile" do
    assert_difference('FormularyProfile.count', -1) do
      delete :destroy, id: @formulary_profile
    end

    assert_redirected_to formulary_profiles_path
  end
end

require 'test_helper'

class FormulariesControllerTest < ActionController::TestCase
  setup do
    @formulary = formularies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:formularies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create formulary" do
    assert_difference('Formulary.count') do
      post :create, formulary: { user_id: @formulary.user_id }
    end

    assert_redirected_to formulary_path(assigns(:formulary))
  end

  test "should show formulary" do
    get :show, id: @formulary
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @formulary
    assert_response :success
  end

  test "should update formulary" do
    patch :update, id: @formulary, formulary: { user_id: @formulary.user_id }
    assert_redirected_to formulary_path(assigns(:formulary))
  end

  test "should destroy formulary" do
    assert_difference('Formulary.count', -1) do
      delete :destroy, id: @formulary
    end

    assert_redirected_to formularies_path
  end
end

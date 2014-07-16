require 'test_helper'

class FormWrappersControllerTest < ActionController::TestCase
  setup do
    @form_wrapper = form_wrappers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:form_wrappers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create form_wrapper" do
    assert_difference('FormWrapper.count') do
      post :create, form_wrapper: { active: @form_wrapper.active, description_en: @form_wrapper.description_en, description_es: @form_wrapper.description_es, description_fr: @form_wrapper.description_fr, description_pt: @form_wrapper.description_pt, title_en: @form_wrapper.title_en, title_es: @form_wrapper.title_es, title_fr: @form_wrapper.title_fr, title_pt: @form_wrapper.title_pt }
    end

    assert_redirected_to form_wrapper_path(assigns(:form_wrapper))
  end

  test "should show form_wrapper" do
    get :show, id: @form_wrapper
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @form_wrapper
    assert_response :success
  end

  test "should update form_wrapper" do
    patch :update, id: @form_wrapper, form_wrapper: { active: @form_wrapper.active, description_en: @form_wrapper.description_en, description_es: @form_wrapper.description_es, description_fr: @form_wrapper.description_fr, description_pt: @form_wrapper.description_pt, title_en: @form_wrapper.title_en, title_es: @form_wrapper.title_es, title_fr: @form_wrapper.title_fr, title_pt: @form_wrapper.title_pt }
    assert_redirected_to form_wrapper_path(assigns(:form_wrapper))
  end

  test "should destroy form_wrapper" do
    assert_difference('FormWrapper.count', -1) do
      delete :destroy, id: @form_wrapper
    end

    assert_redirected_to form_wrappers_path
  end
end

require 'test_helper'

class SectionsControllerTest < ActionController::TestCase
  setup do
    @section = sections(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sections)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create section" do
    assert_difference('Section.count') do
      post :create, section: { description_en: @section.description_en, description_es: @section.description_es, description_fr: @section.description_fr, description_pt: @section.description_pt, form_wrapper_id: @section.form_wrapper_id, sort_index: @section.sort_index, title_en: @section.title_en, title_es: @section.title_es, title_fr: @section.title_fr, title_pt: @section.title_pt }
    end

    assert_redirected_to section_path(assigns(:section))
  end

  test "should show section" do
    get :show, id: @section
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @section
    assert_response :success
  end

  test "should update section" do
    patch :update, id: @section, section: { description_en: @section.description_en, description_es: @section.description_es, description_fr: @section.description_fr, description_pt: @section.description_pt, form_wrapper_id: @section.form_wrapper_id, sort_index: @section.sort_index, title_en: @section.title_en, title_es: @section.title_es, title_fr: @section.title_fr, title_pt: @section.title_pt }
    assert_redirected_to section_path(assigns(:section))
  end

  test "should destroy section" do
    assert_difference('Section.count', -1) do
      delete :destroy, id: @section
    end

    assert_redirected_to sections_path
  end
end

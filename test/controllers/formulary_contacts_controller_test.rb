require 'test_helper'

class FormularyContactsControllerTest < ActionController::TestCase
  setup do
    @formulary_contact = formulary_contacts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:formulary_contacts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create formulary_contact" do
    assert_difference('FormularyContact.count') do
      post :create, formulary_contact: { email: @formulary_contact.email, formulary_id: @formulary_contact.formulary_id, name: @formulary_contact.name, phone: @formulary_contact.phone, project_role: @formulary_contact.project_role }
    end

    assert_redirected_to formulary_contact_path(assigns(:formulary_contact))
  end

  test "should show formulary_contact" do
    get :show, id: @formulary_contact
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @formulary_contact
    assert_response :success
  end

  test "should update formulary_contact" do
    patch :update, id: @formulary_contact, formulary_contact: { email: @formulary_contact.email, formulary_id: @formulary_contact.formulary_id, name: @formulary_contact.name, phone: @formulary_contact.phone, project_role: @formulary_contact.project_role }
    assert_redirected_to formulary_contact_path(assigns(:formulary_contact))
  end

  test "should destroy formulary_contact" do
    assert_difference('FormularyContact.count', -1) do
      delete :destroy, id: @formulary_contact
    end

    assert_redirected_to formulary_contacts_path
  end
end

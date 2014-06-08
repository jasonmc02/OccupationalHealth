require 'test_helper'

class UserFileSharesControllerTest < ActionController::TestCase
  setup do
    @user_file_share = user_file_shares(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_file_shares)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_file_share" do
    assert_difference('UserFileShare.count') do
      post :create, user_file_share: { file_id: @user_file_share.file_id, user_id: @user_file_share.user_id }
    end

    assert_redirected_to user_file_share_path(assigns(:user_file_share))
  end

  test "should show user_file_share" do
    get :show, id: @user_file_share
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_file_share
    assert_response :success
  end

  test "should update user_file_share" do
    patch :update, id: @user_file_share, user_file_share: { file_id: @user_file_share.file_id, user_id: @user_file_share.user_id }
    assert_redirected_to user_file_share_path(assigns(:user_file_share))
  end

  test "should destroy user_file_share" do
    assert_difference('UserFileShare.count', -1) do
      delete :destroy, id: @user_file_share
    end

    assert_redirected_to user_file_shares_path
  end
end

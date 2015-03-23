require 'test_helper'

class PaysitesControllerTest < ActionController::TestCase
  setup do
    @paysite = paysites(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:paysites)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create paysite" do
    assert_difference('Paysite.count') do
      post :create, paysite: { sponsor_id: @paysite.sponsor_id, title: @paysite.title }
    end

    assert_redirected_to paysite_path(assigns(:paysite))
  end

  test "should show paysite" do
    get :show, id: @paysite
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @paysite
    assert_response :success
  end

  test "should update paysite" do
    patch :update, id: @paysite, paysite: { sponsor_id: @paysite.sponsor_id, title: @paysite.title }
    assert_redirected_to paysite_path(assigns(:paysite))
  end

  test "should destroy paysite" do
    assert_difference('Paysite.count', -1) do
      delete :destroy, id: @paysite
    end

    assert_redirected_to paysites_path
  end
end

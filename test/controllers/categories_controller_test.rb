require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get update" do
    get :update
    assert_response :success
  end

  test "should get travel" do
    get :travel
    assert_response :success
  end

  test "should get waste" do
    get :waste
    assert_response :success
  end

  test "should get energy" do
    get :energy
    assert_response :success
  end

end

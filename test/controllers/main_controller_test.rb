require 'test_helper'

class MainControllerTest < ActionController::TestCase
  test "should get first" do
    get :first
    assert_response :success
  end

  test "should get second" do
    get :second
    assert_response :success
  end

  test "should get third" do
    get :third
    assert_response :success
  end

end

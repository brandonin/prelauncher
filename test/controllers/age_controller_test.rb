require 'test_helper'

class AgeControllerTest < ActionController::TestCase
  test "should get verify_age" do
    get :verify_age
    assert_response :success
  end

  test "should get verified_age" do
    get :verified_age
    assert_response :success
  end

end

require 'test_helper'

class PasswordResetsControllerTest < ActionController::TestCase
  test "should get password_resets" do
    get :password_resets
    assert_response :success
  end

end

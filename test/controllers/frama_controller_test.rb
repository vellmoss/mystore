require 'test_helper'

class FramaControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

end

require 'test_helper'

class RedditControllerTest < ActionController::TestCase
  test "should get GoRead" do
    get :GoRead
    assert_response :success
  end

end

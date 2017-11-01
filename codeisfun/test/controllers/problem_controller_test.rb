require 'test_helper'

class ProblemControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "should get page" do
    sign_in users(:user2)
    get problem_page_url
    assert_response :success
  end

end

require 'test_helper'

class ProblemControllerTest < ActionDispatch::IntegrationTest
  test "should get page" do
    get problem_page_url
    assert_response :success
  end

end

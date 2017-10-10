require 'test_helper'

class Ps1ControllerTest < ActionDispatch::IntegrationTest
  test "should get page" do
    get ps1_page_url
    assert_response :success
  end

end

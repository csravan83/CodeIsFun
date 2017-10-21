require 'test_helper'

class SitesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "should get index" do
    sign_in users(:user1)
    get sites_index_url
    assert_response :success
  end

end

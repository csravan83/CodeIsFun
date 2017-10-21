require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "should get index" do
    sign_in users(:admin)
    get users_index_url
    assert_response :success
  end

end

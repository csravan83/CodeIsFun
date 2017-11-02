require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "should get page" do
    sign_in users(:user2)
    get categories_show_url
    assert_response :success
  end
end

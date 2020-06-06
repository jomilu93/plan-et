require 'test_helper'

class OthersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get others_show_url
    assert_response :success
  end

  test "should get destroy" do
    get others_destroy_url
    assert_response :success
  end

end

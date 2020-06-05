require 'test_helper'

class AttractionsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get attractions_show_url
    assert_response :success
  end

  test "should get destroy" do
    get attractions_destroy_url
    assert_response :success
  end

end

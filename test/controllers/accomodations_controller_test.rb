require 'test_helper'

class AccomodationsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get accomodations_show_url
    assert_response :success
  end

  test "should get destroy" do
    get accomodations_destroy_url
    assert_response :success
  end

end

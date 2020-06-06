require 'test_helper'

class TransportationsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get transportations_show_url
    assert_response :success
  end

  test "should get destroy" do
    get transportations_destroy_url
    assert_response :success
  end

end

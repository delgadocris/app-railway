require "test_helper"

class StaticsControllerTest < ActionDispatch::IntegrationTest
  test "should get contact" do
    get statics_contact_url
    assert_response :success
  end

  test "should get our" do
    get statics_our_url
    assert_response :success
  end
end

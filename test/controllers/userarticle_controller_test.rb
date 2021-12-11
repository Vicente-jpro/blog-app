require "test_helper"

class UserarticleControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get userarticle_show_url
    assert_response :success
  end
end

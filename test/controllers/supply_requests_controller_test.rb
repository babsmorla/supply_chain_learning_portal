require "test_helper"

class SupplyRequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get supply_requests_index_url
    assert_response :success
  end

  test "should get new" do
    get supply_requests_new_url
    assert_response :success
  end

  test "should get show" do
    get supply_requests_show_url
    assert_response :success
  end
end

require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pages_index_url
    assert_response :success
  end

  test "should get home" do
    get pages_home_url
    assert_response :success
  end

  test "should get hub" do
    get pages_hub_url
    assert_response :success
  end

  test "should get explore" do
    get pages_explore_url
    assert_response :success
  end

end

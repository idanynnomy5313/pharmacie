require 'test_helper'

class InformationControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get information_show_url
    assert_response :success
  end

  test "should get edit" do
    get information_edit_url
    assert_response :success
  end

  test "should get update" do
    get information_update_url
    assert_response :success
  end

end

require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get view_presentation" do
    get home_view_presentation_url
    assert_response :success
  end

  test "should get set_presentation" do
    get home_set_presentation_url
    assert_response :success
  end

  test "should get view_quality" do
    get home_view_quality_url
    assert_response :success
  end

  test "should get set_quality" do
    get home_set_quality_url
    assert_response :success
  end

end

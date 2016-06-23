require 'test_helper'

class AttachmentControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get attachment_show_url
    assert_response :success
  end

end

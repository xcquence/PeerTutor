require 'test_helper'

class TuteeControllerTest < ActionDispatch::IntegrationTest
  test "should get find_tutor" do
    get tutee_find_tutor_url
    assert_response :success
  end

  test "should get tips_management" do
    get tutee_tips_management_url
    assert_response :success
  end

  test "should get schedule" do
    get tutee_schedule_url
    assert_response :success
  end

end

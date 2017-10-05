require 'test_helper'

class TutorControllerTest < ActionDispatch::IntegrationTest
  test "should get incoming_requests" do
    get tutor_incoming_requests_url
    assert_response :success
  end

  test "should get currently_tutoring" do
    get tutor_currently_tutoring_url
    assert_response :success
  end

  test "should get tutor_profile" do
    get tutor_tutor_profile_url
    assert_response :success
  end

  test "should get piggy_bank" do
    get tutor_piggy_bank_url
    assert_response :success
  end

  test "should get messenger" do
    get tutor_messenger_url
    assert_response :success
  end

end

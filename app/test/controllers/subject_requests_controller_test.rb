require "test_helper"

class SubjectRequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get subject_requests_new_url
    assert_response :success
  end

  test "should get create" do
    get subject_requests_create_url
    assert_response :success
  end
end

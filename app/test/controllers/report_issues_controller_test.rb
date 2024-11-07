require "test_helper"

class ReportIssuesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get report_issues_new_url
    assert_response :success
  end

  test "should get create" do
    get report_issues_create_url
    assert_response :success
  end
end

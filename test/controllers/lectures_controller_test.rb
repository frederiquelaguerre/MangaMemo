require "test_helper"

class LecturesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get lectures_create_url
    assert_response :success
  end

  test "should get destroy" do
    get lectures_destroy_url
    assert_response :success
  end
end

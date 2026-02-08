require "test_helper"

class DiscountsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get discounts_url
    assert_response :success
  end

  test "should create discount" do
    file = fixture_file_upload("rails.png", "image/png")

    assert_difference("Discount.count", 1) do
      post discounts_url, params: {
        discount: {
          title: "New Partner Discount",
          description: "Details here",
          email: "test@example.com",
          expiration_date: 40.days.from_now.to_date.to_s,
          image: file
        }
      }
    end

    assert_response :redirect
    follow_redirect!
    assert_response :success
  end
end

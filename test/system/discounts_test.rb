require_relative "../application_system_test_case"

class DiscountsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit discounts_url
    assert_selector "h1", text: "Partner Discount Submission"
  end
end

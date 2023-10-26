require "test_helper"

class ReviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @jack = users(:jack)
    @jack_costume = costumes(:jack_costume)
    @liz_costume = costumes(:liz_costume)
    login_as @jack
  end

  test "should create review" do
    review_params = { review: { rating: 5, content: "Great costume!" } }

    assert_difference('Review.count') do
      post costume_reviews_path(@liz_costume), params: review_params
    end

    assert_redirected_to costume_path(@liz_costume)
  end
end

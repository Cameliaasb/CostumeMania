require "test_helper"

class ReviewTest < ActiveSupport::TestCase
  test "review must have content" do
    review = Review.new
    assert_not review.save, "Saved the review without attributes"
  end

  test 'a user can review a costume only once' do
    user = users(:jack)
    costume = costumes(:liz_costume)

    # Creating a valid review
    valid_review = Review.new(user: user, costume: costume, rating: 5, content: 'Great costume')
    assert valid_review.valid?, 'Review should be valid'
    valid_review.save

    # Attempt to create another review with the same user and costume, which should be invalid
    duplicate_review = Review.new(user: user, costume: costume, rating: 4, content: 'Another review')
    assert_not duplicate_review.valid?, 'Review should not be valid'
  end
end

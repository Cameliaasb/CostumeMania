require "test_helper"

class ReviewTest < ActiveSupport::TestCase
  test "User can leave only one review per costume" do
    Costume.all.each do |costume|
      reviewers = costume.reviews.map(&:user)
      assert_equal reviewers, reviewers.uniq, "Reviews are not unique for costume #{costume.id}"
    end
  end
end

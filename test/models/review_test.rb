require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
def setup
    @user = users(:Matteo)
    @review = @user.reviews.build(content: "Lorem ipsum")
  end

  test "should be valid" do
    assert @review.valid?
  end

  test "user id should be present" do
    @review.user_id = nil
    assert_not @review.valid?
end

test "content should be present " do
    @review.content = "   "
    assert_not @review.valid?
  end

  test "content should be at most 140 characters" do
    @review.content = "a" * 141
    assert_not @review.valid?
  end

  test "order should be most recent first" do
    assert_equal Review.first, microposts(:most_recent)
  end
  end

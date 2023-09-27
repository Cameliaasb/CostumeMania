require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "All users have an email, a first_name and a last_name" do
    User.all.each do |user|
      assert user.first_name
      assert user.last_name
      assert user.email
    end
  end
end

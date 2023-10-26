require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "users must have attributes" do
    user = User.new
    assert_not user.save, "Saved the user without attributes"
  end

  test "A user should have a first_name, last_name and email" do
    user = User.new
    assert_respond_to user, :first_name, "User model should respond to 'first_name'"
    assert_respond_to user, :last_name, "User model should respond to 'last_name'"
    assert_respond_to user, :email, "User model should respond to 'email'"
  end
end

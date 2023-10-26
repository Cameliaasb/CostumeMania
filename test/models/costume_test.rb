require "test_helper"

class CostumeTest < ActiveSupport::TestCase
  test "Costume shoud have attributes" do
    costume = Costume.new
    assert_not costume.save, "Saved empty costume"
  end

  test "Costume is valid with valid attributes" do
    costume = costumes(:jack_costume)
    assert costume.valid?, "Invalid even with all attributes"
  end

  test "Costume must have an owner" do
    costume = costumes(:jack_costume)
    costume.owner = nil
    assert_not costume.valid?, "Valid without an owner"
  end

  test "Costume must have all necessary attributes" do
    costume = costumes(:jack_costume)
    costume.name = nil
    assert_not costume.valid?, "Valid without a name"
    costume.size = nil
    assert_not costume.valid?, "Valid without a size"
    costume.condition = nil
    assert_not costume.valid?, "Valid without a condition"
    costume.price = nil
    assert_not costume.valid?, "Valid without a price"
    costume.description = nil
    assert_not costume.valid?, "Valid without a description"
  end

  test "Size, gender and condition should be valid" do
    costume = costumes(:jack_costume)
    costume.size = "invalid"
    assert_not costume.valid?, "Valid without a valid size"
    costume.gender = "invalid"
    assert_not costume.valid?, "Valid without a valid gender "
    costume.condition = "invalid"
    assert_not costume.valid?, "Valid without a valid condition"
  end
end

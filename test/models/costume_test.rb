require "test_helper"

class CostumeTest < ActiveSupport::TestCase
  test "All costumes have a name, a description, a gender, a condition, a price and a size" do
    Costume.all.each do |costume|
      assert costume.name
      assert costume.description
      assert costume.size
      assert costume.price
      assert costume.condition
      assert costume.photo
    end
  end
end

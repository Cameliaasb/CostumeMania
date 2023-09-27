require "test_helper"

class CostumeTest < ActiveSupport::TestCase
  test "should not empty costume" do
    costume = Costume.new
    assert_not costume.save, "Saved empty costume"
  end

  test "All costumes have valid attributes (name / description / photo / price / size / condition / gender)" do
    Costume.all.each do |costume|
      assert costume.photo
      assert_instance_of String, costume.name
      assert_instance_of String, costume.description
      assert_instance_of Integer, costume.price
      assert_includes Costume::SIZE, costume.size, "Size not recognized, check for caps or typos"
      assert_includes Costume::CONDITION, costume.condition, "Condition not recognized, check for caps or typos"
      assert_includes Costume::GENDER, costume.gender, "Gender not recognized, check for caps or typos"
    end
  end
end

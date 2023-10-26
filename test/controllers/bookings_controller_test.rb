require "test_helper"

class BookingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @jack = users(:jack)
    @jack_costume = costumes(:jack_costume)
    @liz_costume = costumes(:liz_costume)
  end

  test "A user has to log in to book a costume" do
    get costume_url(@jack_costume)
    assert_select 'input[value="Book now"]', count: 0
    assert_select "a.full-width-button", text: "Log-in"
  end

  test "A user cannot book a costume he owns" do
    login_as @jack
    get costume_url(@jack_costume)
    assert_select 'input[value="Book now"]', count: 0
  end

  # other users costumes
  test "A user can book a costume he doesn't own" do
    login_as @jack
    get costume_url(@liz_costume)
    assert_response :success
    assert_select 'input[value="Book now"]'
  end

  # test "Users can't accept a booking with a starting date in the past" do
  # end
end

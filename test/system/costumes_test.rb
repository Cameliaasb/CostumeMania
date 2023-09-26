require "application_system_test_case"

class CostumesTest < ApplicationSystemTestCase
  setup do
    @jack_costume = costumes(:jack_costume)
    @liz_costume = costumes(:liz_costume)
  end

  test "A user cannot add a new costume if not logged" do
    visit root_url
    assert_no_selector ".nav-link", text: "Add a costume"
  end

  test "A logged user can add a new costume" do
    # login with devise helper
    login_as users(:jack)
    visit root_url
    # Option to add a costume pops
    assert_selector ".nav-link", text: "Add a costume"
    click_on "Add a costume"

    fill_in "costume_name", with: "Test Name"
    select "S", from: "costume_size"
    select "unisex", from: "costume_gender"
    select "used", from: "costume_condition"
    fill_in "costume_description", with: "Test description"
    fill_in "costume_price", with: "1"
    attach_file "costume_photo", "app/assets/images/spidey.jpeg"

    # redirects to costume show
    click_on "Add a new costume"
    assert_selector "h2", text: "Test Name"

    # the new costume is in user dashboard
    visit my_costumes_url
    assert_selector "h3", text: "Test Name"

    # the new costume isn't in index
    visit costumes_url
    assert_no_selector "h3", text: "Test Name"
  end

  test "A user has to log in to book a costume" do
    visit costume_url(@jack_costume)
    assert_no_selector "a", text: "Book now"
    assert_selector "a.full-width-button", text: "Log-in"
  end

  # user's own costumes
  test "A user can update a costume he owns" do
    login_as users(:jack)
    visit costume_url(@jack_costume)
    assert_selector "a", text: "Edit"
    assert_selector "a", text: "Delete"
  end

  test "A user cannot book a costume he owns" do
    login_as users(:jack)
    visit costume_url(@jack_costume)
    assert_no_selector "input[value='Book now']"
  end

  # other users costumes
  test "A user can book a costume he doesn't owns" do
    login_as users(:jack)
    visit costume_url(@liz_costume)
    assert_selector "input[value='Book now']", "User logged but can't book a costume"
  end

  test "A user can't edit or delete costume he doesn't owns" do
    login_as users(:jack)
    visit costume_url(@liz_costume)
    assert_no_selector "a", text: "Edit"
    assert_no_selector "a", text: "Delete"
  end
end

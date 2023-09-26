require "application_system_test_case"

class CostumesTest < ApplicationSystemTestCase
  test "A user cannot add new costume if not logged" do
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
end

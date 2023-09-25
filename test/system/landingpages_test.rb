require "application_system_test_case"

class LandingpagesTest < ApplicationSystemTestCase
  test "visiting the landingpage" do
    visit root_url
    assert_selector "h2", text: "We got you"

    # Find the "Shop all" link by its text and verify it points to the right page
    shop_all_link = find("a", text: "Shop all")
    assert_equal "#{root_url}costumes", shop_all_link[:href]
  end
end

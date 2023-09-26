require "application_system_test_case"

class LandingpagesTest < ApplicationSystemTestCase
  test "Landing page has banner and explanation of concept" do
    visit root_url
    assert_selector ".banner", text: "We got you"
    assert_selector "h3", text: "Concept"
  end

  test "Banner in landing page has link to index" do
    visit root_url
    # Find the "Shop all" link by its text and verify it points to the right page
    shop_all_link = find("a", text: "Shop all")
    assert_equal "#{root_url}costumes", shop_all_link[:href]
  end
end

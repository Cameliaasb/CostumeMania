require "application_system_test_case"

class LandingpagesTest < ApplicationSystemTestCase
  test "visiting the landingpage" do
    visit root_url

    assert_selector "h2", text: "We got you"
  end
end

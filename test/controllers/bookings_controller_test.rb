require "test_helper"

class BookingsControllerTest < ActionDispatch::IntegrationTest
  # test "Users can't book own costumes" do
  # end

  # test "Users can't accept a booking with a starting date in the past" do
  #   # bookings that were not accepted in the past and with a starting date earlier than today
  #   Booking.where("start_date < ? AND status != ?", Date.today, "Accepted").each do |booking|
  #     assert_equal booking.status, "Refused", "Expired booking #{booking.id} still pending"
  #   end
  # end
end

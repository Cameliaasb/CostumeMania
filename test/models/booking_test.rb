require "test_helper"

class BookingTest < ActiveSupport::TestCase
  test "Users can't book own costumes" do
    Booking.all.each do |booking|
      assert_not_equal booking.client, booking.costume.owner, "Booking #{booking.id} is of own costume"
    end
  end

  test "Users can't accept a booking with a starting date in the past" do
    # bookings that were not accepted in the past and with a starting date earlier than today
    Booking.where("start_date < ? AND status != ?", Date.today, "Accepted").each do |booking|
      assert_equal booking.status, "Refused", "Expired booking #{booking.id} still pending"
    end
  end
end

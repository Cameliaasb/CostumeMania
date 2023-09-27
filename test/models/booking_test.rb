require "test_helper"

class BookingTest < ActiveSupport::TestCase
  test "Users can't book own costumes" do
    Booking.all.each do |booking|
      assert_not_equal booking.client, booking.costume.owner, "Booking #{booking.id} is of own costume"
    end
  end

  test "Bookings must all have start and end dates, a client and an owner of costume" do
    Booking.all.each do |booking|
      assert booking.start_date, "Booking #{booking.id} doesn't have a start date"
      assert booking.end_date, "Booking #{booking.id} doesn't have an end date"
      assert booking.costume, "Booking #{booking.id} doesn't have a costume"
      assert booking.costume.owner, "Booking #{booking.id} doesn't have a costume owner"
      assert booking.client, "Booking #{booking.id} doesn't have a client"
    end
  end

  test "Users can't accept a booking with a starting date in the past" do
    # bookings that were not accepted in the past and with a starting date earlier than today
    Booking.where("start_date < ? AND status != ?", Date.today, "Accepted").each do |booking|
      assert_equal booking.status, "Refused", "Expired booking #{booking.id} still pending"
    end
  end
end

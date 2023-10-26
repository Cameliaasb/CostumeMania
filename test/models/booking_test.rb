require "test_helper"

class BookingTest < ActiveSupport::TestCase
  test "Bookings must have attributes" do
    booking = Booking.new
    assert_not booking.save, "Saved the booking without attributes"
    assert_not booking.valid?, "Booking valid without attributes"
  end

  test "A booking should have a costume, a client, and dates" do
    booking = Booking.new
    assert_respond_to booking, :start_date, "Booking model should respond to 'start_date'"
    assert_respond_to booking, :end_date, "Booking model should respond to 'end_date'"
    assert_respond_to booking, :client, "Booking model should respond to 'client'"
    assert_respond_to booking, :costume, "Booking model should respond to 'costume'"
  end

  test "Bookings is valid with valid attributes" do
    booking = bookings(:booking_one)
    assert booking.valid?, "Invalid even with all valid attributes"
  end

  test 'should require start_date and end_date' do
    booking = bookings(:booking_one)
    booking.start_date = nil
    booking.end_date = nil
    assert_not booking.valid?, 'Booking without start_date and end_date should be invalid'

    booking.start_date = Date.today
    booking.end_date = Date.tomorrow
    assert booking.valid?, 'Booking with start_date and end_date should be valid'
  end

  test 'should belong to a client and a costume' do
    booking = bookings(:booking_one)
    booking.client = nil
    booking.costume = nil
    assert_not booking.valid?, 'Booking without client and costume should be invalid'
  end
end

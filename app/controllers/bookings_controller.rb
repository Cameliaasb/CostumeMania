class BookingsController < ApplicationController
  def my_bookings
    ## Bookings that were pending and start date has come are automatically refused
    update_booking_status
    ## Categorized into: Received or Sent. Refused or not. Reviewed or not.
    categorize_bookings
  end

  def new
    ## A client can book a costume for given dates via booking request
    @costume = Costume.find(params[:costume_id])
    @booking = Booking.new
  end

  def create
    ## Client asks to book a costume for given dates
    @booking = Booking.new(booking_params)
    @booking.costume = Costume.find(params[:costume_id])
    @booking.client = current_user
    if @booking.save
      redirect_to my_bookings_path
    else
      flash[:alert] = "Please enter valid dates"
      redirect_to costume_path(@booking.costume)
    end
  end

  def accept
    ## Owner of costume responds positively to client request
    ## Only accessible in view if booking status still pending
    @booking = Booking.find(params[:id])
    @booking.status = "Accepted"
    @booking.save
    redirect_to my_bookings_path
  end

  def refuse
    ## Owner of costume responds negatively to client request
    ## Only accessible in view if booking status still pending
    @booking = Booking.find(params[:id])
    @booking.status = "Refused"
    @booking.save
    redirect_to my_bookings_path
  end

  def edit
    ## Client can change booking request dates if booking still pending
    @booking = Booking.find(params[:id])
    @costume = @booking.costume
    @booking.client = current_user
  end

  def update
    ## Client changes booking request dates
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      redirect_to my_bookings_path
    else
      render :update, status: :unprocessable_entity
    end
  end

  def destroy
    ## Client can cancel booking request if booking still pending
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to my_bookings_path, status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end

  def categorize_bookings
    @received_active_bookings = Booking.all.select { |b| owner(b) && !refused(b) }
    @received_refused_bookings = Booking.all.select { |b| owner(b) && refused(b) }
    @sent_active_bookings_not_reviewed = Booking.all.select { |b| client(b) && !refused(b) && !reviewed(b) }
    @sent_active_bookings_reviewed = Booking.all.select { |b| client(b) && !refused(b) && reviewed(b) }
    @sent_refused_bookings = Booking.all.select { |b| client(b) && refused(b) }
  end

  def owner(booking)
    booking.costume.owner == current_user
  end

  def client(booking)
    booking.user_id == current_user.id
  end

  def refused(booking)
    booking.status == "Refused"
  end

  def reviewed(booking)
    booking.costume.reviews.present? && booking.costume.reviews.where(user: current_user).present?
  end

  def update_booking_status
    Booking.where(status: "Pending").each do |booking|
      booking.status = "Refused" if booking.start_date.past?
      booking.save
    end
  end
end

class BookingsController < ApplicationController
  def my_bookings
    update_booking_status
    categorize_bookings
  end

  def new
    @costume = Costume.find(params[:costume_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.costume = Costume.find(params[:costume_id])
    @booking.client = current_user
    if @booking.save
      redirect_to my_bookings_path
    else
      # pas de gestion des erreurs par datepicker
      render :new, status: :unprocessable_entity
    end
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.status = "Accepted"
    @booking.save
    redirect_to my_bookings_path
  end

  def refuse
    @booking = Booking.find(params[:id])
    @booking.status = "Refused"
    @booking.save
    redirect_to my_bookings_path
  end

  def edit
    @booking = Booking.find(params[:id])
    @costume = @booking.costume
    @booking.client = current_user
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      redirect_to my_bookings_path
    else
      render :update, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to my_bookings_path, status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
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

  def update_booking_status
    Booking.where(status: "Pending").each do |booking|
      booking.status = "Refused" if booking.start_date.past?
      booking.save
    end
  end

  def categorize_bookings
    @received_active_bookings = Booking.all.select { |booking| owner(booking) && !refused(booking) }
    @received_refused_bookings = Booking.all.select { |booking| owner(booking) && refused(booking) }
    @sent_active_bookings = Booking.all.select { |booking| client(booking) && !refused(booking) }
    @sent_refused_bookings = Booking.all.select { |booking| client(booking) && refused(booking) }
  end

end

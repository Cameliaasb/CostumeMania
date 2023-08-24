class BookingsController < ApplicationController
  def my_bookings
    @bookings = Booking.where(client: current_user)
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
      redirect_to costume_path(@booking.costume)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    @costume = @booking.costume
    @booking.client = current_user
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to my_bookings_path, status: :see_other
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to my_bookings_path, status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end

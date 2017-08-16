class BookingsController < ApplicationController
  def index
    @lense = Lense.find(params[:lense_id])
    @bookings = Booking.where("lense = ?", @lense)
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_request_params)
    @booking.user = current_user
    @booking.lense = Lense.find(params[:lense_id])
    respond_to do |format|
      if @booking.save
        format.html { redirect_to @booking.lense, notice: 'Your booking request was successfully sent.' }
        format.json { render :show, status: :created, location: @booking.lense }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
  end

  private

  def booking_request_params
    params.require(:booking).permit(:borrow_date, :return_date, :booking_comment)
  end
end

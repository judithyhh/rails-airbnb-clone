class LensesController < ApplicationController
  #show last 24 created lenses
  def index
    @lenses = Lense.all[-24..-1]
  end

  def search
    search_lenses = Lense.where("location = ? AND lens_type = ? AND brand = ? AND price < ?", params[:location], params[:lens_type], params[:brand], params[:price].to_f)
    @lenses = []
    search_lenses.each do |lens|
      bookings_array = lens.bookings
      bookings_array.each do |booking|
        has_overlap? = (params[:borrow_date] - booking.end_date) * (booking.borrow_date - params[:end_date]) >= 0
        @lenses << booking.lens unless has_overlap? && if @lenses.include?(booking.lens)
      end
    end
  end

  def new

  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
  end

  private

end

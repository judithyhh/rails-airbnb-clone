class LensesController < ApplicationController
  #show last 24 created lenses
  def index
    @lenses = Lense.all[-24..-1]
  end

  def search
    search_lenses = Lense.where("location = ?, lens_type = ? AND brand = ? AND price < ?", params[:location], params[:lens_type], params[:brand], params[:price].to_f)
    @lenses = []
    search_lenses.each do |lense|
      bookings_array = lense.bookings
      bookings_array.each do |booking|
        has_overlap = (params[:borrow_date] - booking.return_date) * (booking.borrow_date - params[:return_date]) >= 0
        @lenses << booking.lense unless has_overlap && if @lenses.include?(booking.lense)
      end
    end
  end

  def new
    @lense = Lense.new
  end

  def create
    @lense = Lense.new(lense_params)
    respond_to do |format|
      if @lense.save
        format.html { redirect_to @lense, notice: 'Your listing was successfully created.' }
        format.json { render :show, status: :created, location: @lense }
      else
        format.html { render :new }
        format.json { render json: @lense.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
    @lense = Lense.find(:id)
  end

  private

  def lense_params
    params.require(:lense).permit(:user, :lens_type, :brand, :price, :condition, :location)
  end

end

class LensesController < ApplicationController
  def index
    if params[:search] == "true"
      searched_lenses = Lense.where(nil)
      filtering_params(params).each do |key, value|
        searched_lenses = searched_lenses.public_send(key, value) if value.present?
      end
      if params[:borrow_date].present? && params[:return_date].present?
        borrow_date = Date.new(params[:borrow_date][0..3].to_i, params[:borrow_date][5..6].to_i, params[:borrow_date][8..9].to_i)
        return_date = Date.new(params[:return_date][0..3].to_i, params[:return_date][5..6].to_i, params[:return_date][8..9].to_i)
        @lenses = []
        searched_lenses.each do |lense|
          if lense.bookings.nil?
            @lenses << lense
          else
            has_overlap_array = []
            lense.bookings.each do |booking|
              has_overlap = (borrow_date - booking.return_date) * (booking.borrow_date - return_date) >= 0
              has_overlap_array << 1 if has_overlap
            end
            @lenses << lense unless has_overlap_array.include?(1)
          end
        end
      else
        @lenses = searched_lenses
      render 'index'
    end
    else
      render 'pages/home'
    end
  end

  # def index
  #   @lenses = Lense.all

  #   @lenses_to_mark = Lense.where.not(latitude: nil, longitude: nil)

  #   @hash = Gmaps4rails.build_markers(@lenses_to_mark) do |lense, marker|
  #     marker.lat lense.latitude
  #     marker.lng lense.longitude
  #     # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
  #   end
  # end

  # def search
  #   search_lenses = Lense.where("location = ?, lens_type = ? AND brand = ? AND price < ?", params[:location], params[:lens_type], params[:brand], params[:price].to_f)
  #   @lenses = []
  #   search_lenses.each do |lense|
  #     if lense.bookings.nil?
  #       @lenses << lense
  #     else
  #       has_overlap_array = []
  #       lense.bookings.each do |booking|
  #         has_overlap = (params[:borrow_date] - booking.return_date) * (booking.borrow_date - params[:return_date]) >= 0
  #         has_overlap_array << 1 if has_overlap
  #       end
  #       @lenses << lense unless has_overlap_array.include?(1)
  #     end
  #   end
  # end

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
    @lense = Lense.find(params[:id])

    @hash = Gmaps4rails.build_markers(@lense) do |lense, marker|
      marker.lat lense.latitude
      marker.lng lense.longitude
    end

  end

  private

  def lense_params
    params.require(:lense).permit(:user_id, :lens_type, :brand, :price, :condition, :location, :photo, :photo_cache)
  end

  def filtering_params(params)
    params.slice(:location, :lens_type, :brand, :price)
  end

end

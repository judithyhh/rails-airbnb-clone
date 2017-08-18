class PagesController < ApplicationController
  def home
    @lenses = Lense.all.order('created_at DESC').limit(9)
  end

  def dashboard
    @user = current_user
    if @user.nil?
      render 'home'
    else
      @lenses = @user.lenses
      @bookings_received = []
      @lenses.each do |lense|
        lense.bookings.each do |booking|
          @bookings_received << booking
        end
      end
      @bookings_requested = []
      @user.bookings.each do |booking|
        @bookings_requested << booking
      end
      @bookings_received_pending = []
      @bookings_received_approved = []
      @bookings_received_rejected = []
      @bookings_received.each do |booking|
        if booking.approved_by_owner.nil?
          @bookings_received_pending << booking
        elsif booking.approved_by_owner == true
          @bookings_received_approved << booking
        elsif booking.approved_by_owner == false
          @bookings_received_rejected << booking
        end
      end
      @bookings_requested_pending = []
      @bookings_requested_approved = []
      @bookings_requested_rejected = []
      @bookings_requested.each do |booking|
        if booking.approved_by_owner.nil?
          @bookings_requested_pending << booking
        elsif booking.approved_by_owner == true
          @bookings_requested_approved << booking
        elsif booking.approved_by_owner == false
          @bookings_requested_rejected << booking
        end
      end
    end
  end
end

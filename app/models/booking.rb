class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :lense

  validates :user, :lense, :borrow_date, :return_date, :booking_comment, presence:true
end

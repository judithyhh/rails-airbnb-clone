class Lense < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :lens_type, inclusion: { in: ["Kit", "Standard", "Prime", "Telephoto Zoom", "Macro", "Wide Angle"] }
  validates :user, :brand, :price, :condition, :location, presence: true
  mount_uploader :photo, PhotoUploader
end

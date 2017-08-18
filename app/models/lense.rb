class Lense < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :lens_type, inclusion: { in: ["Kit", "Standard", "Prime", "Telephoto Zoom", "Macro", "Wide Angle"] }
  validates :user, :brand, :price, :condition, :location, presence: true
  validates :brand, inclusion: { in: ["Canon", "Leica", "Minolta", "Nikon", "Olympus"] }
  validates :condition, inclusion: { in: ["Excellent", "Good", "Usable"] }
  validates :location, inclusion: { in: ["Chengdu", "Shanghai", "Suzhou", "Beijing", "Xinjiang", "Shenzhen", "Guangzhou"] }
  validates :user_id, :price, :photo, presence: true

  mount_uploader :photo, PhotoUploader

  geocoded_by :location
  after_validation :geocode, if: :location_changed?

  scope :location, -> (location) { where location: location }
  scope :brand, -> (brand) { where brand: brand }
  scope :lens_type, -> (lens_type) { where lens_type: lens_type }
  scope :price, -> (price) { where("price <= ?", price) }
end

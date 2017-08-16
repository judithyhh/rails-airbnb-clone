class Lense < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :lens_type, inclusion: { in: ["Kit", "Standard", "Prime", "Telephoto Zoom", "Macro", "Wide Angle"] }
  validates :brand, inclusion: { in: ["Canon", "Leica", "Minolta", "Nikon", "Olympus"] }
  validates :condition, inclusion: { in: ["Excellent", "Good", "Usable"] }
  validates :location, inclusion: { in: ["Chengdu", "Shanghai", "Suzhou", "Beijing", "Xinjiang", "Shenzhen", "Guangzhou"] }
  validates :user_id, :price, presence: true
  mount_uploader :photo, PhotoUploader
end

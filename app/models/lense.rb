class Lense < ApplicationRecord
  belongs_to :user

  validates :lens_type, inclusion: { in: ["Kit", "Standard", "Prime", "Telephoto Zoom", "Macro", "Wide Angle"] }
  validates :user, :brand, :price, :condition, presence: true
end

class Space < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 100 }
  validates :address, presence: true
  validates :price_per_hour, presence: true
  validates :type, presence: true
  enum type: { indoor: 0, outdoor: 1 }
  # has_many_attached :photos
end

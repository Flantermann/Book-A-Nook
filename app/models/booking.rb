class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :space

  validates :start_date, :end_date, :price, presence: true
end

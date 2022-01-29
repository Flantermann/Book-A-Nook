class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :space

  validates :start_date, :end_date, :price, :status, presence: true
  enum status: { pending: 0, confirmed: 1 }
end

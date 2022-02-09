class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :space

  validates :start_date, :end_date, :status, presence: true
  enum status: { pending: 0, confirmed: 1, declined: 2 }
end

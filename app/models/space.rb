class Space < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 100 }
  validates :address, presence: true
  validates :price_per_hour, presence: true
  validates :category, presence: true
  enum category: { indoor: 0, outdoor: 1 }
  has_many_attached :photos

  include PgSearch::Model
  pg_search_scope :search_spaces,
    against: [
      [:address, 'A'], [:title, 'B'], [:description, 'C']
    ],
    using: {
      tsearch: { prefix: true }
    }
end

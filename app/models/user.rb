class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bookings # bookings as a client
  has_many :spaces
  has_many :bookings_as_owner, through: :spaces, source: :bookings
  has_many :bookmarks, dependent: :destroy

  validates :first_name, :last_name, :email, presence: true
  validates :email, presence: true, uniqueness: true, format: {
    with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  }
end

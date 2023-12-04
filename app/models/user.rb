class User < ApplicationRecord
  has_many :cars, through: :my_reservations
  has_many :my_reservations

  validates :username, presence: true, uniqueness: true
end

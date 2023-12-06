class Car < ApplicationRecord
  acts_as_paranoid
  has_many :users, through: :my_reservations
  has_many :my_reservations

  validates :name, presence: true, length: { minimum: 2, maximum: 150 }
  validates :description, presence: true
  validates :pricePerHr, presence: true
  validates :seating_capacity, presence: true
  validates :rental_duration, presence: true
end

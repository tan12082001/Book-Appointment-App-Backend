class Car < ApplicationRecord
  has_and_belongs_to_many :users, join_table: :my_reservations
  validates :name, presence: true
  validates :description, presence: true
  validates :pricePerHr, presence: true
  validates :seating_capacity, presence: true
  validates :rental_duration, presence: true

  # Add any other validations or associations you need
end

class MyReservation < ApplicationRecord
  belongs_to :user
  belongs_to :car

  validates :date, presence: true
  validates :city, presence: true

  # Add any other validations or associations you need
end

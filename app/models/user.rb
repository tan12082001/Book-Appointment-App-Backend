class User < ApplicationRecord
  has_and_belongs_to_many :cars, join_table: :my_reservations
  validates :username, presence: true, uniqueness: true

  # Add any other validations or associations you need
end

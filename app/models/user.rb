class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :jwt_authenticatable, jwt_revocation_strategy: Devise::JWT::RevocationStrategies::Null

  has_many :cars, through: :my_reservations
  has_many :my_reservations

  validates :username, presence: true, uniqueness: true
end

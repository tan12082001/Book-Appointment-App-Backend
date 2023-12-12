class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  has_many :my_reservations
  has_many :cars, through: :my_reservations

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true
end

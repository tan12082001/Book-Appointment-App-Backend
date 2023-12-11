
require 'rails_helper'

RSpec.describe Car, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(2).is_at_most(150) }

    it { should validate_presence_of(:description) }

    it { should validate_presence_of(:pricePerHr) }

    it { should validate_presence_of(:seating_capacity) }

    it { should validate_presence_of(:rental_duration) }
  end

  describe 'associations' do
    it { should have_many(:my_reservations) }
    it { should have_many(:users).through(:my_reservations) }
  end

  describe 'acts_as_paranoid' do
    it { should act_as_paranoid }
  end
end

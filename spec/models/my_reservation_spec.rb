require 'rails_helper'

RSpec.describe MyReservation, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:city) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:car) }
  end
end

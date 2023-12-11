require 'rails_helper'

RSpec.describe MyReservation, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:car) }
  end

  # Add tests for other validations here
end

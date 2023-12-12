require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:my_reservations) }
    it { is_expected.to have_many(:cars).through(:my_reservations) }
  end

  # Add tests for other validations here
end

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      user = User.new(username: 'testuser', email: 'user@example.com', password: 'password')

      expect(user).to be_valid
    end

    it 'is not valid without a username' do
      user = User.new(email: 'user@example.com', password: 'password')

      expect(user).not_to be_valid
      expect(user.errors[:username]).to include("can't be blank")
    end

    it 'is not valid without an email' do
      user = User.new(username: 'testuser', password: 'password')

      expect(user).not_to be_valid
      expect(user.errors[:email]).to include("can't be blank")
    end

    it 'is not valid with a duplicate username' do
      User.create(username: 'testuser', email: 'user1@example.com', password: 'password')
      user = User.new(username: 'testuser', email: 'user2@example.com', password: 'password')

      expect(user).not_to be_valid
      expect(user.errors[:username]).to include('has already been taken')
    end
  end

  describe 'associations' do
    it 'has many cars through my_reservations' do
      user = User.reflect_on_association(:cars)
      expect(user.macro).to eq(:has_many)
      expect(user.options[:through]).to eq(:my_reservations)
    end

    it 'has many my_reservations' do
      user = User.reflect_on_association(:my_reservations)
      expect(user.macro).to eq(:has_many)
    end
  end
end

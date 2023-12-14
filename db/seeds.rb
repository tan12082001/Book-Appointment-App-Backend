# Create users
User.create(username: 'user1')
User.create(username: 'user2')

# Create cars
Car.create(
  name: 'Car1',
  description: 'Description for Car1',
  pricePerHr: '10.00',
  seating_capacity: 4,
  rental_duration: 2
)

Car.create(
  name: 'Car2',
  description: 'Description for Car2',
  pricePerHr: '15.00',
  seating_capacity: 5,
  rental_duration: 3
)

# Create reservations
user1 = User.find_by(username: 'user1')
user2 = User.find_by(username: 'user2')

car1 = Car.find_by(name: 'Car1')
car2 = Car.find_by(name: 'Car2')

MyReservation.create(user: user1, car: car1, date: Date.today, city: 'City1')
MyReservation.create(user: user2, car: car2, date: Date.today + 1, city: 'City2')

require 'swagger_helper'
require 'rails_helper'

RSpec.describe 'Api::MyReservationsControllers', type: :request do
  before do
    post '/api/users', params: {
      user: {
        username: 'user',
        email: 'user@example.com',
        password: 'password'
      }
    }
    post '/api/users/sign_in', params: {
      user: {
        username: 'user',
        password: 'password'
      }
    }
    session = JSON.parse(response.body).deep_symbolize_keys
    @token = session[:token]
  end

  describe 'GET /index' do
    it 'returns an array of reservations made by the current user' do
      get '/api/my_reservations'
      JSON.parse(response.body)
      expect(response.status).to eq(200)
    end
  end

  describe 'POST /create' do
    context 'creating a reservation with valid parameters' do
      it 'creates a reservation' do
        car = Car.create(name: 'car', description: 'description of car', pricePerHr: 20, image: 'photo.jpg',
                         seating_capacity: 3, rental_duration: 3)
        post "/api/car/#{car.id}/new_reserve", params: {
          my_reservation: {
            date: '2024-10-10',
            city: 'Lagos'
          }
        }

        json = JSON.parse(response.body)
        expect(response.status).to eq(201)
        expect(json['city']).to eq('Lagos')
        expect(json['date']).to eq('2024-10-10')
        expect(json['car_id']).to eq(car.id)
      end
    end

    context 'creating a reservation with invalid parameters' do
      it 'returns an error' do
        car = Car.create(name: 'car', description: 'description of car', pricePerHr: 20, image: 'photo.jpg',
                         seating_capacity: 3, rental_duration: 3)
        post "/api/car/#{car.id}/new_reserve", params: {
          my_reservation: {
            date: '',
            city: ''
          }
        }

        expect(response.status).to eq(422)
      end
    end
  end
end

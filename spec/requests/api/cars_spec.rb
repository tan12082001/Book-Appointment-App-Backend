require 'swagger_helper'
require 'rails_helper'

RSpec.describe 'Api::CarsControllers', type: :request do
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
    it 'returns an array of cars' do
      get '/api/all_cars'
      json = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(json).to be_a(Array)
    end
  end

  describe 'GET /show' do
    context 'request for an existing car' do
      it 'returns a single car' do
        car = Car.create(name: 'car', description: 'description of car', pricePerHr: 20, image: 'photo.jpg',
                         seating_capacity: 3, rental_duration: 3)
        get "/api/cars/#{car.id}"

        json = JSON.parse(response.body)
        expect(response.status).to eq(200)
        expect(json['name']).to eq('car')
        expect(json['description']).to eq('description of car')
      end
    end

    context 'request for a non-existent car' do
      it 'returns an error' do
        id = 1138
        get "/api/cars/#{id}"

        expect(response.status).to eq(404)
      end
    end
  end

  describe 'POST /create' do
    context 'creating a car with the correct parameters' do
      it 'creates a car' do
        post '/api/car/new_car', params: {
          car: {
            name: 'test_car',
            description: 'description of test_car',
            pricePerHr: 20,
            image: 'photo.jpg',
            seating_capacity: 3,
            rental_duration: 3
          }
        }

        json = JSON.parse(response.body)
        expect(response.status).to eq(201)
        expect(json['name']).to eq('test_car')
        expect(json['description']).to eq('description of test_car')
      end
    end

    context 'creating a car with the wrong parameters' do
      it 'returns an error message' do
        post '/api/car/new_car', params: {
          car: {
            name: '',
            description: ''
          }
        }

        JSON.parse(response.body)
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'DELETE /destroy' do
    context 'a delete request for an existing car' do
      it 'deletes a car' do
        car = Car.create(name: 'car2', description: 'description for car2', pricePerHr: 20, image: 'photo.jpg',
                         seating_capacity: 3, rental_duration: 3)
        delete "/api/cars/#{car.id}", headers: { Authorization: "Bearer #{@token}" }

        json = JSON.parse(response.body)
        expect(response.status).to eq(200)
        expect(json['message']).to eq('Car marked as removed')
      end
    end

    context 'a delete request for an non-existent car' do
      it 'returns an error message' do
        car = Car.create(name: 'car2', description: 'description for car2', pricePerHr: 20, image: 'photo.jpg',
                         seating_capacity: 3, rental_duration: 3)
        Car.destroy(car.id)
        delete "/api/cars/#{car.id}", headers: { Authorization: "Bearer #{@token}" }

        expect(response.status).to eq(404)
      end
    end
  end
end

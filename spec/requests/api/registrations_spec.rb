require 'swagger_helper'
require 'rails_helper'

RSpec.describe 'Api::RegistrationsControllers', type: :request do
  describe 'POST /create' do
    context 'when user registration is successful' do
      it 'creates a new user' do
        post '/api/users/', params: {
          user: {
            username: 'user',
            email: 'user@example.com',
            password: 'password'
          }
        }

        json = JSON.parse(response.body).deep_symbolize_keys
        expect(response.status).to eq(200)
        expect(json[:message]).to eq('Signup successful')
        expect(json[:user][:username]).to eq('user')
      end
    end

    context 'when user registration fails' do
      it 'returns an error message' do
        post '/api/users', params: {
          user: {
            username: ''
          }
        }
        json = JSON.parse(response.body).deep_symbolize_keys
        expect(response.status).to eq(422)
        expect(json[:errors]).to include("Username can't be blank")
        expect(json[:errors]).to include("Email can't be blank")
        expect(json[:errors]).to include("Password can't be blank")
      end
    end
  end
end

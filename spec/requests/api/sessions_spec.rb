require 'swagger_helper'
require 'rails_helper'

RSpec.describe 'Api::SessionsControllers', type: :request do
  before do
    post '/api/users', params: {
      user: {
        username: 'user',
        email: 'user@example.com',
        password: 'password'
      }
    }
  end

  describe 'POST /create' do
    context 'successful user login' do
      it 'logs a user in' do
        post '/api/users/sign_in', params: {
          user: {
            username: 'user',
            password: 'password'
          }
        }

        json = JSON.parse(response.body).deep_symbolize_keys
        expect(response.status).to eq(200)
        expect(json[:message]).to eq('Login successful')
      end
    end

    context 'failed user login' do
      it 'returns an error message' do
        post '/api/users/sign_in', params: {
          user: {
            username: 'login_user',
            password: 'password'
          }
        }

        json = JSON.parse(response.body).deep_symbolize_keys
        expect(response.status).to eq(401)
        expect(json[:message]).to eq('Invalid username or password')
      end
    end
  end
end

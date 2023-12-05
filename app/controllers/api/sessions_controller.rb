class Api::SessionsController < Devise::SessionsController
  respond_to :json

  def create
    super do |resource|
      render json: { message: 'Login successful', user: resource }
      return
    end
  end

  def destroy
    super do
      render json: { message: 'Logout successful' }
      return
    end
  end

  def index
    if current_user
      render json: { message: 'User data retrieved successfully', user: current_user }
    else
      render json: { message: 'No user logged in' }, status: :unprocessable_entity
    end
  end
end

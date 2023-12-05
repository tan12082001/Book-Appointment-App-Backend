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
end

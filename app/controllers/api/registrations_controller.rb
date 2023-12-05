class Api::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    super do |resource|
      render json: { message: 'Signup successful', user: resource }
      return
    end
  end
end

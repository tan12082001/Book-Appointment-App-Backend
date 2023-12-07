class Api::SessionsController < Devise::SessionsController
  respond_to :json

  def create
    user = User.find_by(username: params[:user][:username])

    if user&.valid_password?(params[:user][:password])
      sign_in(user)
      render json: { message: 'Login successful', user: }
    else
      render json: { message: 'Invalid username or password' }, status: :unauthorized
    end
  end

  def destroy
    jwt_payload = JWT.decode(request.headers['Authorization'].split[1],
                             Rails.application.credentials.fetch(:secret_key_base)).first
    current_user = User.find(jwt_payload['sub'])
    return unless current_user

    sign_out(current_user)
    render json: { message: 'Logout successful' }
    nil
  end

  def index
    if current_user
      render json: { message: 'User data retrieved successfully', user: current_user }
    else
      render json: { message: 'No user logged in' }, status: :unprocessable_entity
    end
  end
end

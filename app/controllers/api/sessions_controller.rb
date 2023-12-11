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

  def index
    if current_user
      render json: { message: 'User data retrieved successfully', user: current_user }
    else
      render json: { message: 'No user logged in' }, status: :unprocessable_entity
    end
  end

  def respond_to_on_destroy
    if request.headers['Authorization'].present?
      jwt_payload = JWT.decode(request.headers['Authorization'].split.last,
                               Rails.application.credentials.fetch(:secret_key_base)).first
      current_user = User.find(jwt_payload['sub'])
    end
    if current_user
      render json: {
        status: 200,
        message: 'Logged out successfully.'
      }, status: :ok
    else
      render json: {
        status: 401,
        message: "Couldn't find an active session."
      }, status: :unauthorized
    end
  end
end

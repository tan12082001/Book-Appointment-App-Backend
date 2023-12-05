class Api::MyReservationsController < ApplicationController
  # before_action :authenticate_user!
    
  def index
    @user = User.find(params[:user_id])
    @reservations = MyReservation.where(user_id: @user.id).includes(:car)
    reservations_json = @reservations.map do |item|
      {
        "car" => {
          "id" => item.car.id,
          "name" => item.car.name
        },
        "date" => item.date,
        "city" => item.city,
        "created_at" => item.created_at,
        "updated_at" => item.updated_at
      }
    end

    render json: reservations_json
  end
end

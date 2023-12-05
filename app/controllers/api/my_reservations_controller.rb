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

  def create
    @user = User.find(params[:user_id])
    @car = Car.find(params[:car_id])

    @reservation = MyReservation.new(reserve_params)
    @reservation.user = @user
    @reservation.car = @car

    if @reservation.save
      render json: @reservation, status: :created, location: api_path(@user)
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  private

  def reserve_params
    params.require(:my_reservation).permit(:date, :city)
  end
end

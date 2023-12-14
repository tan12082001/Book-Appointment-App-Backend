class Api::MyReservationsController < ApplicationController
  before_action :authenticate_api_user!

  def index
    @reservations = MyReservation.where(user_id: current_api_user)
    reservations_json = @reservations.map do |item|
      car = Car.with_deleted.find(item.car_id)
      {
        'car' => {
          'id' => car.id,
          'name' => car.name
        },
        'date' => item.date,
        'city' => item.city,
        'created_at' => item.created_at,
        'updated_at' => item.updated_at
      }
    end

    render json: reservations_json
  end

  def create
    @car = Car.find(params[:car_id])

    if @car.deleted_at.nil?
      @reservation = MyReservation.new(reserve_params)
      @reservation.user = current_api_user
      @reservation.car = @car

      if @reservation.save
        render json: @reservation, status: :created, location: api_my_reservations_path
      else
        render json: @reservation.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'Cannot create reservation for a deleted car' }, status: :unprocessable_entity
    end
  end

  private

  def reserve_params
    params.require(:my_reservation).permit(:date, :city)
  end
end

Rails.application.routes.draw do
  namespace :api do
    get 'all_cars', to: 'cars#index'
    get 'cars/:id', to: 'cars#show'
    post 'car/new_car', to: 'cars#create'
    get 'user/:user_id/my_reservations', to: 'my_reservations#index'
    post 'user/:user_id/car/:car_id/new_reserve', to: 'my_reservations#create'
  end
end

Rails.application.routes.draw do
  namespace :api do
    get 'all_cars', to: 'cars#index'
    get 'cars/:id', to: 'cars#show'
    get 'my_reservations', to: 'my_reservations#index'
  end
end

Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  namespace :api do
    get 'all_cars', to: 'cars#index'
    get 'cars/:id', to: 'cars#show'
  end
end

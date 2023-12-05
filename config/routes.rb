Rails.application.routes.draw do
  namespace :api do
    devise_for :users,
      controllers: {
        sessions: 'api/sessions',
        registrations: 'api/registrations'
      }

    get 'all_cars', to: 'cars#index'
    get 'cars/:id', to: 'cars#show'
  end
end

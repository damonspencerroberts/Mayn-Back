Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :users, only: %w[show]
    post '/update_user_age', to: 'users#update_age'
    post '/update_user_description', to: 'users#update_description'
    post '/update_user_favorites', to: 'users#update_favorites'
    post '/update_user_location', to: 'users#update_location'
    post '/update_user_avatar', to: 'users#update_avatar'
  end

  devise_for :users,
             defaults: { format: :json },
             path: '',
             path_names: {
               sign_in: 'api/login',
               sign_out: 'api/logout',
               registration: 'api/signup'
             },
             controllers: {
               sessions: 'sessions',
               registrations: 'registrations'
             }

  post '/api/user_sessions', to: 'user_sessions#verify'
  post '/api/user_exists', to: 'user_sessions#exists'
end

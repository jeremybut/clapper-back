Rails.application.routes.draw do
  use_doorkeeper

  devise_for :users, controllers: { passwords: 'passwords' }

  namespace :api do
    namespace :v1 do
      post :signup, to: 'signup#create'

      # Movies
      resources :movies, only: %i[index show]

      # Users
      resources :users, only: :update do
        collection do
          get '/me', to: 'users#me'
        end
      end
    end
  end

  root to: 'root#index'
end

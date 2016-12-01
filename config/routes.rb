Rails.application.routes.draw do
  use_doorkeeper

  devise_for :users, controllers: { passwords: 'passwords' }

  namespace :api do
    namespace :v1 do
      post :signup, to: 'signup#index'

      # Movies
      resources :movies, only: :index

      # Users
      resources :users, only: [:index, :update] do
        collection do
          get '/me', to: 'users#me'
        end
      end
    end
  end

  root to: 'root#index'
end

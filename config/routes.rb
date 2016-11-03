Rails.application.routes.draw do
  use_doorkeeper

  devise_for :users, controllers: { passwords: 'passwords' }

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :update]
      post :signup, to: 'signup#index'
    end
  end

  root to: 'root#index'
end

Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  root to: 'pages#home'
  resources :games, only: [:new, :create, :edit, :update, :show] do
    member do
      get :solution
      get :results
    end
  end
  resources :playlists, only: [:index] do
    member do
      get :create_tracks
    end
  end
  resources :players, only: [:update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

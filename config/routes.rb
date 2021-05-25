Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :games, only: [:new, :create, :edit, :update, :show] do
    member do
      get :solution :results
    end
  end
  resources :playlist, only: [:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
u_id string
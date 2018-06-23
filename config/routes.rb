Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :tweets, only: [:index, :show, :create]
  resources :users, only: [:edit, :update]

  root "tweets#index"

  namespace :admin do
    resources :tweets
    resources :users, only: [:index]
  end

end

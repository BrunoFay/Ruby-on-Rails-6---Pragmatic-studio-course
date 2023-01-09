Rails.application.routes.draw do
  root "films#index"
  resources :films do
    resources :reviews
  end

  resources :users
  get "signup" => "users#new"


  resource :session, only: [:new,:create,:destroy]
  get "signin" => "sessions#new"
end

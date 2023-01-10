Rails.application.routes.draw do
  resources :genres
  root "films#index"
  
  resources :films do
    resources :reviews
    resources :favorites
  end

  resources :users
  get "signup" => "users#new"


  resource :session, only: [:new,:create,:destroy]
  get "signin" => "sessions#new"
end

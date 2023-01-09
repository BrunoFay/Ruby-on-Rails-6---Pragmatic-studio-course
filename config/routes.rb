Rails.application.routes.draw do
  root "films#index"
  resources :films do
    resources :reviews
  end

  resources :users
  get "signup" => "users#new"

end

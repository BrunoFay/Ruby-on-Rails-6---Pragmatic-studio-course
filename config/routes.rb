Rails.application.routes.draw do
  resources :films do
    resources :reviews
  end

  root "films#index"
  resources :films
end

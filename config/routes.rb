Rails.application.routes.draw do
  resources :reviews
 root "films#index"
 resources :films
end

Rails.application.routes.draw do
  resources :photos
  resources :client_reviews
  resources :barber_reviews
  resources :clients
  resources :barbers
  resources :appointments
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

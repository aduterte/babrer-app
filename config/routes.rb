Rails.application.routes.draw do
  resources :photos
  resources :client_reviews
  resources :barber_reviews
  resources :clients
  resources :barbers
  resources :appointments
  resources :client_review_comments
  resources :barber_review_comments
  
  post "/logins", to: "logins#login"
  get "/logins", to: "logins#token_authenticate"

  Rails.application.routes.draw do
    resources :conversations, only: [:index, :create]
    resources :messages, only: [:index, :create]
    mount ActionCable.server => '/cable'
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

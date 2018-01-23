Rails.application.routes.draw do
  resources :discards
  resources :card_requests
  resources :cards
  resources :militaries
  resources :hierarchies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'militaries#index'

  get 'create_card_request', to: 'card_requests#create', as: :create_card_request
  get 'print_request', to: 'card#create', as: :print_request

end

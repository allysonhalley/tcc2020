Rails.application.routes.draw do
  resources :discards
  resources :cards
  resources :card_requests
  resources :militaries
  resources :hierarchies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'militaries#index'

  get 'create_card_request', to: 'card_requests#create', as: :create_card_request
  get 'print_request', to: 'cards#create', as: :print_request
  get 'cancel_card_request(.:id)', to:'card_requests#cancel', as: :cancel_card_request
  patch 'giving_card', to:'cards#giving', as: :giving_card
  patch 'returning_card', to:'cards#returning', as: :returning_card

  #Print one card
  post 'print_a_card', to: 'cards#print_a_card', as: :print_a_card
  #Print 4 first cards
  get 'print_cards', to: 'cards#print_cards', as: :print_cards
  post 'create_cards', to: 'cards#create_cards', as: :create_cards

end

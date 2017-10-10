Rails.application.routes.draw do

  get 'chat/index'


  root 'home#index'

  get 'home/authentication'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :conversations, only: [:create] do
    member do
      post :close          #???
    end

    resources :messages, only: [:create]
  end

  #mount ActionCable.server, at: '/cable'

end

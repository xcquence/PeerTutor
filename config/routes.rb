Rails.application.routes.draw do
  get 'messages/index'

  get 'messages/create'

  root 'home#index'

  get 'home/authentication'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :messages   #generates all CRUD links for every action in MessagesController

end

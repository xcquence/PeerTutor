Rails.application.routes.draw do
  root 'home#index'

  get 'home/authentication'
  get 'loggo' => 'home#tester'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end

Rails.application.routes.draw do

  get 'chat/index'

  get 'tutor/index'

  get 'tutor/incoming_requests'

  get 'tutor/currently_tutoring'

  get 'tutor/tutor_profile'

  get 'tutor/piggy_bank'

  get 'tutor/messenger'

  get 'tutee/index'

  get 'tutee/find_tutor'

  get 'tutee/tips_management'

  get 'tutee/schedule'

  get 'tutee/messenger'

  root 'home#index'

  get 'home/authentication'


  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :conversations, only: [:create]

end

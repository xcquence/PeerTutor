Rails.application.routes.draw do

  get 'chat/index'

  get 'tutor/index'

  get 'tutor/incoming_requests'

  get 'tutor/currently_tutoring'

  get 'tutor/tutor_profile'

  get 'tutor/piggy_bank'

  get 'tutor/messenger'

  get 'tutor/toggle_is_live'

  get 'tutor/is_live'

  post 'tutor/toggle_is_live'

  get 'tutee/index'

  get 'tutee/find_tutor'

  get 'tutee/tips_management'

  get 'tutee/schedule'

  get 'tutee/messenger'

  root 'home#index'

  get 'home/authentication'

  get 'tutor/first_time_tutor'

  get 'tutee/get_courses'

  get 'tutee/update'

  post 'tutor/update'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :conversations, only: [:create] do
    member do
      post :close
    end

    resources :messages, only: [:create]
  end
end

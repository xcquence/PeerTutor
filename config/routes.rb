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

  get 'tutee/currency'

  get 'tutee/messenger'

  root 'home#index'

  get 'home/authentication'

  get 'tutor/first_time_tutor'

  post 'tutor/update'

  get 'thanks' , to: 'currencies#thanks', as: 'thanks'

  get 'stripe_accounts/full', to: 'stripe_accounts#full'

  post 'currency/update'


  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :conversations, only: [:create] do
    member do
      post :close
    end

    resources :messages, only: [:create]
  end

  resources :tutee, only: [:find_tutor] do
    collection do
      get 'get_courses'  # /tutee/get_courses
    end
  end
  resources :tutors
  resource :currency
  resources :stripe_accounts
  resources :bank_accounts

end

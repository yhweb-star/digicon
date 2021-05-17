Rails.application.routes.draw do
  get 'rooms/show'
  devise_for :schools, controllers: {
    sessions:      'schools/sessions',
    passwords:     'schools/passwords',
    registrations: 'schools/registrations'
  }

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  root 'homes#index'

  resources :rooms do
    resources :messages
  end
  resources :events
  resources :contacts

end

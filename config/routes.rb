Rails.application.routes.draw do
  devise_for :schools
  devise_for :users

  root 'homes#index'
  
end

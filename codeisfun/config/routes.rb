Rails.application.routes.draw do
  get 'users/index'

  devise_for :admins
  devise_for :users
  get 'sites/index'

  root 'sites#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  get 'problem/page'

  get 'users/index'
  get 'problem/page'

  devise_for :admins
  devise_for :users
  get 'sites/index'

  root 'sites#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

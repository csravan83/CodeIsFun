Rails.application.routes.draw do
  get 'home/index'

  get 'divisions/show'

  post 'divisions/show'

  get 'sites/index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
end

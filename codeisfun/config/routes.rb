Rails.application.routes.draw do
  resources :problems
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # mount "sites/index" => redirect("https://web1.cs.ait.ac.th/"), :constraints => { :protocol => "http://" }
  # mount "sites/index" => redirect("https://web1.cs.ait.ac.th/"), :constraints => { :subdomain => "" }

  get 'users/index'

  get 'categories/show'
  get 'categories/index'
  get 'categories/new'
  post 'categories/new'

  # get 'problems/index'
  get 'sites/index'
  root 'sites#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'users/ban'
  get 'users/unban'

  get 'users/show'

end

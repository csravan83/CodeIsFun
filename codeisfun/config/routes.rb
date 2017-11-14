Rails.application.routes.draw do

  resources :problems do
    resources :comments
    resources :solutions
  end


  # get '/comments/new/(:problem_id)', to: 'comments#new', as: :new_comment

  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # mount "sites/index" => redirect("https://web1.cs.ait.ac.th/"), :constraints => { :protocol => "http://" }
  # mount "sites/index" => redirect("https://web1.cs.ait.ac.th/"), :constraints => { :subdomain => "" }

  get 'users/index'

  get 'categories/show'
  post 'categories/show'
  get 'categories/index'
  get 'categories/new'
  post 'categories/new'

  get 'categories/create'
  post 'categories/create'



  # get 'problems/index'
  get 'sites/index'
  root 'sites#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'users/ban'
  get 'users/unban'
  get 'users/show'

  post 'comments/create'
end

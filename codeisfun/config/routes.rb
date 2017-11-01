Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # mount "sites/index" => redirect("https://web1.cs.ait.ac.th/"), :constraints => { :protocol => "http://" }
  # mount "sites/index" => redirect("https://web1.cs.ait.ac.th/"), :constraints => { :subdomain => "" }

  get 'users/index'
  get 'categories/show'
  get 'sites/index'
  get 'categories/index'
  root 'sites#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'users/ban'
  get 'users/unban'

  get 'users/show'

end

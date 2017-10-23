Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # mount "sites/index" => redirect("https://web1.cs.ait.ac.th/"), :constraints => { :protocol => "http://" }
  # mount "sites/index" => redirect("https://web1.cs.ait.ac.th/"), :constraints => { :subdomain => "" }

  get 'users/index'
  get 'problem/page'
  get 'sites/index'

  root 'sites#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do

  get 'ps6/index'

  get 'ps5/index'

  get 'ps4/index'

  get 'ps1/page'

  # PS1
  get 'home/index'
  get 'divisions/show'
  post 'divisions/show'
  get 'ps1/page'
  # root 'home#index'

  # PS2
  get 'basics/quotations'
  # root 'basics#quotations'
  post 'basics/quotations'
  get 'basics/export'
  get 'basics/destroy'
  get 'basics/findauthor'
  get 'basics/import'
  post '/basics' => 'basics#import'

  # PS3
  get 'site/index'
  get 'users/index'
  get 'users/admin'
  get 'users/user'
  get 'users/user1'
  root 'site#index'
  get 'users/txt'
  get 'users/dbdump'

  # PS4
  get 'ps4/index'

  # PS5
  get 'ps5/index'

  # PS6
  get 'ps6/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

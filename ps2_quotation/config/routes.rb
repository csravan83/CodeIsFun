Rails.application.routes.draw do
  get 'basics/quotations'
  root 'basics#quotations'

  post 'basics/quotations'
  get 'basics/export'
  get 'basics/destroy'
  get 'basics/findauthor'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

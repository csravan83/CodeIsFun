Rails.application.routes.draw do
  get 'basics/quotations'
  root 'basics#quotations'

  post 'basics/quotations'
  get 'basics/export'
  get 'basics/destroy'
  get 'basics/findauthor'
  get 'basics/import'
  post '/basics' => 'basics#import'

end

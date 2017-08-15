Rails.application.routes.draw do
  get 'lenses/search'

  get 'lenses/new'

  get 'lenses/create'

  get 'lenses/edit'

  get 'lenses/update'

  get 'lenses/destroy'

  get 'lenses/show'

  get 'lenses/index'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

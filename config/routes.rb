Rails.application.routes.draw do

resources :lenses do
  resources :bookings, only: [:index, :new, :create]
end
resources :bookings, only: [:edit, :update]

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'lenses#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end

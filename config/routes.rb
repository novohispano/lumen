Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :photos
    resources :sessions, only: [:create, :destroy]

    get    '/login',  to: 'sessions#new'
    delete '/logout', to: 'sessions#destroy'

    get '/', to: 'dashboard#show'
  end

  root 'site#show'
end

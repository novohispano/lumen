Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :photos
    resources :projects
    resources :sessions, only: [:create, :destroy]

    get    '/login',  to: 'sessions#new'
    delete '/logout', to: 'sessions#destroy'

    get '/', to: 'dashboard#show'
  end

  namespace :api do
    namespace :v1 do
      resources :projects, only: [:index]
    end
  end

  resources :projects, only: [:index]

  root 'site#show'
end

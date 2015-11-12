Rails.application.routes.draw do
  namespace :admin do
    resources :highlights
    resources :news
    resources :photos
    resources :projects
    resources :sessions, only: [:create, :destroy]
    resources :users

    get    '/login',  to: 'sessions#new'
    delete '/logout', to: 'sessions#destroy'

    get '/', to: 'dashboard#show'
  end

  namespace :api do
    namespace :v1 do
      resources :projects, only: [:index]
    end
  end

  resources :news,     only: [:index, :show]
  resources :projects, only: [:index]

  get  '/contact', to: 'contact#show'
  post '/contact', to: 'contact#create'

  root 'site#show'
end

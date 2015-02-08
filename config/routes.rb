Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :sessions, only: [:new, :create, :destroy]
    
    get '/', to: 'dashboard#show'
  end

  root 'site#show'
end

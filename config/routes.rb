Rails.application.routes.draw do
  namespace :admin do
    resources :dashboard, only: [:show]
    resources :users
  end

  root 'site#show'
end

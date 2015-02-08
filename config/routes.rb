Rails.application.routes.draw do
  namespace :admin do
    resources :users

    get '/', to: 'dashboard#show'
  end

  root 'site#show'
end

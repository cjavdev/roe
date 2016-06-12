Rails.application.routes.draw do
  root to: 'static_pages#root'
  get '/welcome', to: 'static_pages#welcome'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
end

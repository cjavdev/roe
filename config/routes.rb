Rails.application.routes.draw do
  get 'sales/new'

  get 'sales/index'

  root to: 'static_pages#root'
  get 'welcome', to: 'static_pages#welcome'
  get 'login', to: 'static_pages#login'
  get 'privacy', to: 'static_pages#terms'
  get 'terms', to: 'static_pages#privacy'

  resources :items do
    member do
      post 'add_size', to: 'items#add_size'
      delete 'remove_size', to: 'items#remove_size'
    end
  end

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
end

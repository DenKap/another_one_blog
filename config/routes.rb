Rails.application.routes.draw do

  root 'home#index'

  get 'login', to: 'home#login'
  get 'logout', to: 'home#logout'
  post 'session', to: 'home#create_session'

  resources :categories, only: :show do
    resources :posts, except: :index
  end

  resources :categories, :posts do
    resources :comments, only: %i[create destroy]
  end

  resources :comments, only: %i[create destroy]

  get 'success', to: 'requests#success'

  namespace :admin do

    root 'categories#index'

    resources :categories
    resources :settings, only: %i[index update]
  end

end

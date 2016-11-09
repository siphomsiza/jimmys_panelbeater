Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, class_name: "User"

  authenticated :user do
    root "dashboard#index", as: :authenticated_root
  end

  root to: 'home#index'
  get 'dashboard/index'

  namespace :documents do
    resources :categories do
      resources :categories
      resources :documents
    end
  end

  namespace :galleries do
    resources :albums do
      resources :galleries
    end
  end

end

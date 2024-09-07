Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  authenticated :user do
    root 'books#index', as: :authenticated_root
  end

  root 'welcome#index'
  resources :users

  resources :books do
    resources :reviews, only: [:create, :destroy]
  end

  resources :genres do
    collection do
      get 'search'
    end
  end
end

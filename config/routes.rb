Rails.application.routes.draw do
  root "books#index"

  resources :books do
    resources :reviews, only: [:create, :destroy]
  end

  resources :genres do
    collection do
      get 'search'
    end
  end
end

Rails.application.routes.draw do
  root "books#index"

  resources :books do
    resources :reviews, only: [:create, :destroy]
  end
end

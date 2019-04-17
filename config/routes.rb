Rails.application.routes.draw do
  resources :articles, only: [:index] do
    patch :like, on: :member
  end

  root to: 'articles#index'
end

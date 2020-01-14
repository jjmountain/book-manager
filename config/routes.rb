Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [ :index, :show, :create ]
      resources :books, only: [ :index, :show ]
      resources :loans, only: [ :index, :show, :create ]
      patch 'return', to: 'loans#return'
      post 'income', to: 'books#income'
    end
  end
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [ :show, :create, :index ]
      resources :books, only: [ :show ]
      resources :loans, only: [ :show, :create ]
      patch 'return', to: 'loans#return'
      post 'income/:id', to: 'books#income'
    end
  end
end

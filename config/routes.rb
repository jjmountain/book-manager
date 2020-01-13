Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [ :show, :create ]
      resources :books, only: [ :show ]
      resources :loans, only: [ :show, :create, :update ]
    end
  end
end
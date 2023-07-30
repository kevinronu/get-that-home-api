Rails.application.routes.draw do
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users, only: %i[create]
  get "/profile", to: "users#show"
  patch "/profile", to: "users#update"

  resources :properties, except: %i[new edit]
  get "/my_properties", to: "my_properties#index"
  resources :favorites, only: %i[index create destroy]
  resources :contacts, only: %i[index create destroy]
  # root "articles#index"
end

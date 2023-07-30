Rails.application.routes.draw do
  resources :users, only: %i[show create update]
  resources :properties, except: %i[new edit]
  get "/my_properties", to: "my_properties#index"
  resources :favorites, only: %i[index create destroy]
  resources :contacts, only: %i[index create destroy]
  # root "articles#index"
end

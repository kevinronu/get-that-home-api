Rails.application.routes.draw do
  resources :users, only: %i[show create update]
  resources :properties, except: %i[new edit]
  resources :favorites, only: %i[index create destroy]
  resources :contacts, only: %i[index create destroy]
  # root "articles#index"
end

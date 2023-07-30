Rails.application.routes.draw do
  resources :users, only: %i[show create update]
  resources :properties, except: %i[new edit]
  resources :favorites, only: %i[index create destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

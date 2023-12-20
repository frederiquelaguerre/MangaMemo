Rails.application.routes.draw do
  get 'mangas/index'
  get 'mangas/show'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :mangas do
    resources :chapitres, only: [:show] do
      resources :lectures, only: [:create, :destroy]
      # resources :bookmarks, only: [:create]
    end
    resources :bookmarks, only: [:create]
  end
  resources :lists, only: [:index, :show, :create, :destroy] do
    resources :bookmarks, only: [:destroy]
  end
  resources :lectures, only: [:destroy]
  resources :users, only: [:show]
end

# resources :search, only: [:index] # For search feature (Algolia)
# resources :comments, only: [:create, :destroy]
# resources :notifications, only: [:index, :destroy] # For notifications



# Defines the root path route ("/")
# root "posts#index"

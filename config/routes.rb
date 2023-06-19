Rails.application.routes.draw do
  devise_for :users
  root to: "listings#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :listings, only: %i[index show new create] do
    resources :reservations, only: %i[new create destroy show]
  end

  resources :wishlists do
    resources :favourites
  end

  # Defines the root path route ("/")
  # root "articles#index"

  get "hosting", to: "pages#hosting"

end

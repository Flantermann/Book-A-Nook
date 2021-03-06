Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :spaces do
    resources :bookings, only: :create
    resources :bookmarks, only: [:create, :destroy]
  end
  resources :bookings, except: [:new, :create] do
    member do
      patch 'accept', to: "bookings#accept"
      patch 'decline', to: "bookings#decline"
    end
  end
  get "/dashboard", to: "dashboards#index"
  get "/listings", to: "listings#index"
  get "/bookmarks", to: "bookmarks#index"

  put "/dashboard", to: "bookings#mark_as_accepted"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

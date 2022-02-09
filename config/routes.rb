Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :spaces do
    resources :bookings, only: :create
  end
  resources :bookings, except: [:new, :create]

  get "/dashboard", to: "dashboards#index"
  get "/listings", to: "listings#index"

  put "/dashboard", to: "bookings#mark_as_accepted"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

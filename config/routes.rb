Rails.application.routes.draw do
  # get 'braintree/new'
  # post 'braintree/checkout'

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "users", only: [:create, :edit, :show] do
  resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]

  end


  get "/listings/search" => "listings#search", as: "listing_search"
  resources :listings

  resources :listings, only: [:show] do 
    resources :reservations
  end 

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "users#new", as: "sign_up"

 get "/reservations/:reservation_id/braintree/new" => "braintree#new", as:"braintree_new"
  post "/reservations/:reservation_id/braintree/checkout" => "braintree#checkout", as:"braintree_checkout"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#index'
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
end




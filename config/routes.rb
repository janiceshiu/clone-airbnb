Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # Static Pages
  root 'static_pages#home'
  get 'help' => 'static_pages#help'
  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'

  # Clearance Default Routes
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"

  # Listings
  get "/listings/autocomplete", to: "listings#autocomplete", as: "listings_autocomplete"
  resources :listings, except: [:destroy]


  # Reservations and payments
  resources :reservations do
  	resources :payments, only: [:new, :create]
  end


  # Omniauth + Users
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  resources :users, only: [:show, :edit, :update, :destroy]



end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

# Users
  get "/users" => "users#index"

  get "users/new" => "users#new"

  get "/users/:id" => "users#show"

  post "/users" => "users#create"


#Products
  get "/users/:user_id/products" => "products#index"

  get "/users/:user_id/products/new" => "products#new" 

  post "/users/:user_id/products/" => "products#create", as: :user_products

  get "users/:user_id/products/:product_id" => "products#show"


#Bids
  post "/users/:user_id/products/:product_id/bids" => "bids#create", as: :product_bids

end

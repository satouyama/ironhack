Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  get "/" => "contacts#index", as: :index

  get "/new" => "contacts#new", as: :new
  post "/create" => "contacts#create"

end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/", to: "site#home"    # if get routes / go to    it's actually a hash {to: "site#home"} 
  get "/contact", to: "site#contact" 


  get "/projects" => "projects#index"

  get "projects/new" => "projects#new"  # has to go before projects/:id
  get "/projects/:id" => "projects#show"

  post "/projects" => "projects#create"

end

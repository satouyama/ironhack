Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/", to: "site#home"    # if get routes / go to    it's actually a hash {to: "site#home"} 
  get "/contact", to: "site#contact" 


  get "/projects" => "projects#index"

  get "/projects/new" => "projects#new"  # has to go before projects/:id
  get "/projects/:id" => "projects#show"

  post "/projects" => "projects#create"

  get "/projects/:project_id/time_entries" => "time_entries#index"

  get "/projects/:project_id/time_entries/new" => "time_entries#new"

  post "/projects/:project_id/time_entries" => "time_entries#create", as: :project_time_entries

  get "/projects/:project_id/time_entries/:id/edit" => "time_entries#edit"

  patch "/projects/:project_id/time_entries/:id" => "time_entries#update", as: :project_time_entry




end

Rails.application.routes.draw do
# HOME
  root 'home#index'

# SESSIONS
  get "/auth/:provider/callback" => "sessions#create"
  delete '/logout', to: 'sessions#destroy'

  get '/sites/:id/additional-info' => 'sites#edit_additional_info', as: 'add_info'
  patch '/sites/:id' => 'sites#update_additional_info'
  # difficult with route matching??
  
  resources :sites do
    resources :team_members
    resources :gallery_pictures
    resources :testimonials
    resources :treatments
  end

end

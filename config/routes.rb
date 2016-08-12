Rails.application.routes.draw do
# HOME
  root 'home#index'

# SESSIONS
  get "/auth/:provider/callback" => "sessions#create"
  delete '/logout', to: 'sessions#destroy'

  resources :sites do
    resources :team_members
    resources :gallery_pictures
    resources :testimonials
    resources :treatments
  end
end

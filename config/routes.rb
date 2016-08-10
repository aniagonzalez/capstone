Rails.application.routes.draw do
# HOME
  root 'home#index'

# SESSIONS
  get "/auth/:provider/callback" => "sessions#create"
  delete '/logout', to: 'sessions#destroy'
end

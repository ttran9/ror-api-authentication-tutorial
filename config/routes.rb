Rails.application.routes.draw do
  resources :sessions, only: [create] # allow us to have access to session.
  root to: "static#home"
end

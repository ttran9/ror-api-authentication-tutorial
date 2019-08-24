Rails.application.routes.draw do
  resources :sessions, only: [:create] # allow us to have access to session.
  resources :registrations, only: [:create]
  delete :logout, to: "sessions#logout"
  get :logged_in, to: "sessions#logged_in"
  root to: "static#home"
end

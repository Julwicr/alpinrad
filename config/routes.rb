Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "karte", to: "pages#karte"
  get "admin", to: "admin#dashboard"
  resources :stations, except: :show
end

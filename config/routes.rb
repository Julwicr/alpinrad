Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "karte", to: "pages#karte"
  get "admin", to: "admin#dashboard"
  resources :bookings
  resources :stations, except: :show do
    resources :station_schedules, only: %i[destroy create]
  end
  get "station/:id/toggle_shown", to: "stations#toggle_shown", as: "toggle_shown"
end

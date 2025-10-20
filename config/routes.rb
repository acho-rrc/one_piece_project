Rails.application.routes.draw do
  resources :ships
  resources :pirates
  resources :crews

  get "about", to: "pages#about"
  root "pages#home"
end
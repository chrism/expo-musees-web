Rails.application.routes.draw do

  root 'home#index'

  get 'se_connecter' => 'sessions#new', as: :se_connecter
  get 'se_deconnecter' => 'sessions#destroy', as: :se_deconnecter
  get 'inscription' => 'user#new', as: :inscription

  get 'profil' => 'user#show', as: :profil

  resources :actualites
  resources :musees
  resources :sessions
  resources :user
end

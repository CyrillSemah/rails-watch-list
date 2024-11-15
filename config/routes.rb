Rails.application.routes.draw do
  get 'bookmarks/new'
  get 'lists/index'
  get 'lists/show'
  get 'lists/new'
  # Routes pour les listes
  resources :lists, only: [:index, :show, :new, :create] do
    resources :bookmarks, only: [:new, :create]  # Routes pour les signets (bookmarks) dans une liste donnée
  end
  resources :bookmarks, only: [:destroy]  # Route pour la suppression des signets

  # Définir la page d'accueil pour lister toutes les listes
  root "lists#index"
end

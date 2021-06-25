Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'lists#index'
  resources :lists, only: [:index, :show, :new, :create, :update] do
    resources :bookmarks, only: [:show, :new, :create]
  end
  resources :bookmarks, only: [:destroy]
end

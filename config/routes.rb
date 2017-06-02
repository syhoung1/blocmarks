Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  
  resources :topics do
    resources :bookmarks, except: [:index] do
      resources :likes, only: [:create, :destroy, :index]
    end
  end
  
  get 'welcome/index'
  get 'welcome/about'

  authenticated :user do
    root 'topics#index', as: :authenticated_root
  end
  
  root 'welcome#index'
  
  post :incoming, to: "incoming#create"
end

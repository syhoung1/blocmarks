Rails.application.routes.draw do
  devise_for :users
  
  resources :topics
  
  get 'welcome/index'
  get 'welcome/about'

  authenticated :user do
    root 'topics#index', as: :authenticated_root
  end
  
  root 'welcome#index'
end

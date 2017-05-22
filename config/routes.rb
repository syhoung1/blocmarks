Rails.application.routes.draw do
  devise_for :users

  get 'welcome/index'
  get 'welcome/about'

  # authenticated :user do
  #   root ''
  # end
  
  root 'welcome#index'
end

Rails.application.routes.draw do

  get 'recipes/index'

  get 'welcome/index'
  
  root 'welcome#index'
  
  resources :articles do
    resources :comments
  end
end

Rails.application.routes.draw do

  get 'recipes/index'
  
  get 'articles/index'
  
  get 'welcome/index'
  
  root 'welcome#index'
  
  resources :articles
  
  resources :articles do
    resources :comments
  end
end

Rails.application.routes.draw do

  get 'recipes/index'
  
  get 'articles/new'
  
  get 'welcome/index'
  
  root 'welcome#index'
  #root 'articles#new'
  
  resources :articles
  
  resources :articles do
    resources :comments
  end
end

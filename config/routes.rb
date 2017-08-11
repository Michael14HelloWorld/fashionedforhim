Rails.application.routes.draw do
  
  mount Ckeditor::Engine => '/ckeditor'
  
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  get 'recipes/index'
  get 'articles/index'
  get 'welcome/index'
  root 'welcome#index'
  
  resources :articles
  
  resources :articles do
    resources :comments
  end
end
Rails.application.routes.draw do
  get 'dashboard/index'

  get 'welcome/index'
  
  root 'welcome#index'
  
  resources :dashboard
  
  resources :articles do
    resources :comments
  end
end

Rails.application.routes.draw do
  get 'dashboard/index'

  devise_for :admins
  get 'login/index'

  get 'welcome/index'
  
  root 'welcome#index'
  
  resources :login
  
  resources :articles do
    resources :comments
  end
end

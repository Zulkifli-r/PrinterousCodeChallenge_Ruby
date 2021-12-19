Rails.application.routes.draw do
  devise_for :users
  resources :organizations do
    resources :people
    get 'account_manager/new', to: 'account_manager#new', as: 'account_manager_new'
    post 'account_manager', to: 'account_manager#create', as: 'account_manager_create'
    delete 'account_manager', to: 'account_manager#destroy', as: 'account_manager_destroy'
    # resources :account_manager
  end
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

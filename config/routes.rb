Rails.application.routes.draw do

  get 'search_results/index'

  # Campaigns (of leads)
  resources :campaigns do
    resources :leads
  end

  # users' callbacks
  resources :callbacks

  # pg_search results page(s)
  resources :search_results, only: [:index]

  # 'Administrate' gem dashboards
  namespace :admin do
    resources :users
    root to: "users#index"
  end

  # Users and profiles
  devise_for :users, :controllers => {
    registrations: 'registrations',
    sessions: 'sessions',
    passwords: 'passwords'
  }
  resources :users, only: [:index, :show, :edit, :update, :destroy]
  match 'users/:id' => 'users#destroy', via: :delete, :as => :admin_destroy_user
  match 'users/:id' => 'users#show', via: :get, :as => :profile
  authenticated :user do
    root 'users#current_user_home', as: :authenticated_user
  end

  # Home and About pages
  get 'about' => 'welcome#about'
  root 'welcome#index'

end

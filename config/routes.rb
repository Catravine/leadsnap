Rails.application.routes.draw do

  get 'search_results/index'

  # Campaigns (of leads)
  resources :campaigns do
    resources :leads
  end

  resources :leads do
    collection do
      post :import
    end
  end

  # users' callbacks (`Callback` is already used in ActiveSupport)
  resources :recalls

  # pg_search results page(s)
  resources :search_results, only: [:index]

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

Rails.application.routes.draw do

  # 'Administrate' gem dashboards
  namespace :admin do
    resources :users
    root to: "users#index"
  end

  # Users and profiles
  devise_for :users
  #devise_for :users, :controllers => { registrations: 'registrations' }
  match 'users/:id' => 'users#show', :as => :profile, via: :get
  authenticated :user do
    root 'users#current_user_home', as: :authenticated_user
  end

  # Home and About pages
  get 'about' => 'welcome#about'
  root 'welcome#index'

end

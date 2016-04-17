Rails.application.routes.draw do

  devise_for :users
  # Home and About pages
  get 'about' => 'welcome#about'
  root 'welcome#index'

end

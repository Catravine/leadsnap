Rails.application.routes.draw do

  # Home and About pages
  get 'about' => 'welcome#about'
  root 'welcome#index'

end

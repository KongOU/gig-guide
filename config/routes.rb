Rails.application.routes.draw do

  resources :musicians
  resources :events
  root 'welcome#index'

end

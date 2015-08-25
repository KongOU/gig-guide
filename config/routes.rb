Rails.application.routes.draw do
  devise_for :users
  resources :events
  resources :musicians
  root 'welcome#index'
end

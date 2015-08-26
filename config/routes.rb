Rails.application.routes.draw do
  devise_for :users
  resources :events
  resources :musicians
  root 'welcome#index'

  get '/khmer' => 'welcome#khmer'
  get '/western' => 'welcome#western'
end

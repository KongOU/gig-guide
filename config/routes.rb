Rails.application.routes.draw do
  get 'pages/about'
  get 'pages/contact'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :events do
    collection do
      get 'search'
    end
    resources :registers
  end
  resources :musicians
  root 'welcome#index'

  get '/khmer' => 'welcome#khmer'
  get '/western' => 'welcome#western'
end

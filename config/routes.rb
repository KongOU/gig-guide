Rails.application.routes.draw do
  get 'pages/about'

  get 'pages/contact'

  devise_for :users
  resources :events do
    collection do
      get 'search'
    end
  end
  resources :musicians
  root 'welcome#index'

  get '/khmer' => 'welcome#khmer'
  get '/western' => 'welcome#western'
end

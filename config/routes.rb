Rails.application.routes.draw do
  root 'welcome#index'

  resources :events

end

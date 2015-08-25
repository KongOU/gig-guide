Rails.application.routes.draw do
<<<<<<< HEAD
  devise_for :users
root 'home#index'

  resources :events
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
=======
>>>>>>> eb4da83e5c1313dfa0585ae07b6c489d08c55ee0

  resources :musicians
  resources :events
  root 'welcome#index'

end

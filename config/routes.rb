Rails.application.routes.draw do

  resource :session, :only => [:create, :destroy]
  resources :users, :except => [:destroy]
  # get 'search' => 'parties#search', as: 'search'
  # post 'search_results' => 'parties#search_results', as: 'search_results'
  # get 'show_search_results' => 'parties#show_search_results', as: 'show_search_results'
  resources :parties do
    get 'query_form', on: :member
    get 'query_results', on: :member
    resources :rsvps, :only => [:create, :edit, :update]
    resources :claimed_dishes, :only => [:create]
  end
  get 'signout' => 'sessions#destroy', as: 'signout'

  root 'welcome#index'

  get 'enter' => 'welcome#auth', as: 'enter'

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



  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end

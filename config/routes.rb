Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  root 'application#show'

  # cars routes
  put 'cars/update/:car_id' => 'cars#update'
  get 'cars/show' => 'cars#show'
  get 'cars/index' => 'cars#index'
  get 'cars/get/:car_id' => 'cars#get'
  post 'cars' => 'cars#create'



  # supplies routes
  get 'supplies' => 'supplies#index'
  get 'supplies/get/:supply_id' => 'supplies#get'
  get 'supplies/show/:car_id' => 'supplies#show'
  post 'supplies' => 'supplies#create'
  put 'supplies/update/:supply_id' => 'supplies#update'

  # consumption routes
  get 'car_consumption/report' => 'consumption#search'

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

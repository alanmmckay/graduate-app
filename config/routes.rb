Rails.application.routes.draw do
  get 'users/', to: 'users#landing'
  get 'users/show', to: 'users#show'
  get 'users/login', to: 'users#landing'
  get 'users/new', to: 'users#new'
  get 'users/logout', to: 'users#destroy'
  get 'users/applications', to: 'grad_application#index'
  get 'users/applications/new', to: 'grad_application#new'
  get 'grad_application/new', to: 'grad_application#new'
  #get 'users/applications/show/:id', to: 'grad_application#show', as: 'application'
  get 'students/new', to: 'students#new'

  post 'users/', to: 'users#login'
  post 'users/login', to: 'users#login'
  post 'users/create', to: 'users#create'
  post 'grad_application/create', to: 'grad_application#create'
  post 'student/create', to: 'student#create'

  get 'users/error', to: 'users#error'
  root 'users#landing'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#show'

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

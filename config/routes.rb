Rails.application.routes.draw do

  # Get methods in regards to the users controller.
  get 'users/', to: 'users#landing'
  get 'users/show', to: 'users#show'
  get 'users/login', to: 'users#landing'
  get 'users/new', to: 'users#new'
  get 'users/logout', to: 'users#destroy'
  get 'users/edit', to: 'users#edit'
  #This is to redirect anyone trying to access the site using a 'students/' url
  get 'students/', to: 'users#show'


  # Get methods in regards to the students controller.
  # The students controller is activated and used once a user starts an...
  #...application:
  get 'students/new', to: 'students#new'
  get 'students/edit', to: 'students#edit'
  get 'students/degree', to: 'students#degree'
  # redirects get access of degree_creation to the degree action...
  #... note post usage below to make sense of this:
  get 'students/degree_creation', to: 'students#degree'

  # Get methods in regards to the grad_applications controller.
  get 'applications/', to: 'grad_applications#index'
  get 'applications/new', to: 'grad_applications#new'
  get 'applications/show/:id', to: 'grad_applications#show', as: 'applications_show'

  get 'applications/edit/:id', to: 'grad_applications#edit', as: 'applications_edit'

  # Get methods in regards to the degrees controller.
  get 'degrees/edit/:id', to: 'degrees#edit'
  get 'degrees/update' #this will be used for redirection
  get 'degrees/edit' #this will be used for redirection
  get 'degrees/application_update' #this will be used for redirection

  #get 'users/applications/show/:id', to: 'grad_applications#show', as: 'application'

  # Post methods in regards to the users controller.
  post 'users/', to: 'users#login'
  post 'users/login', to: 'users#login'
  post 'users/create', to: 'users#create'
  post 'users/update', to: 'users#update'

  # Post methods in regards to the students controller
  post 'student/create', to: 'students#create'
  post 'students/degree_creation', to: 'students#degree_creation'
  post 'students/update', to: 'students#update'

  post 'applications/create', to: 'grad_applications#create'
  #This post will insert the degree into the relevant degrees collection. It...
  #... will then present a page represented within degree_creation.html.haml
  #... which allows the insertion of another degree. This process could be...
  #... made to be more concise; will likely change:


  get 'letter_of_recommendation/edit/:id', to: 'letter_of_recommendation#edit'
  put 'letter_of_recommendation/update/:id', to: 'letter_of_recommendation#update'

  post 'degrees/edit/:id', to: 'degrees#application_edit'
  put 'degrees/update/:id', to: 'degrees#update'
  put 'degrees/application_update/:id', to: 'degrees#application_update'

  get 'users/error', to: 'users#error' #uncertain if this is being used
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

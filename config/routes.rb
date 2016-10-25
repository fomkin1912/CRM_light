Rails.application.routes.draw do
     
  devise_for :users, controllers: {:registrations => 'admin/registrations', :sessions => 'admin/sessions'}
  
  scope module: 'admin' do
    resources :users, except: [:create]
    resources :users, path: 'my_users', only: [:create]
    resources :departments
    resources :positions
  end

# Pathes for mass assignment users to group
#  get 'groups/select_users/:id', to: 'groups#select_users', as: :select_users_groups

  resources :groups
  resources :company_types
  resources :companies
  resources :contacts
  resources :activity_types
  resources :activities

  get "serve_activities/planned", to: "serve_activities#planned"
  get "serve_activities/completed", to: "serve_activities#completed"

  root to: 'welcome#index'

  #Path to add_users action in GroupsController

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

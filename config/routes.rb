Rails.application.routes.draw do
  
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"

  resources :sessions
  resources :users
  resources :admin
  resources :password_resets
  resources :password_changes
  resources :user_settings
  resources :valuers
  resources :valuation_fees
  resources :law_firms
  resources :legal_fees
  resources :insurance_firms
  resources :insurance_premiums
  resources :property_identification
  resources :property_descriptions
  resources :property_types

  #post "users/login"
 # get "admin/admin_dashboard"
  get "admin_dashboard" => "admin#admin_dashboard", :as => "admin_dashboard"

  #delete 'logout' => 'users#logout'

  get "admin/show"

   #get 'password reset' => 'password_resets#edit', :as => 'password_reset'
   #get 'password_resets/:id/edit', to: 'password_resets#create', as: :send_password_reset

 # get "logout" => "sessions#destroy", :as => "logout"
  #get "login" => "users#login", :as => "login"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'sessions#new'

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

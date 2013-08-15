DbeventsRails::Application.routes.draw do
  scope '/admin' do
    resources :events
    resources :suggestions, :only => [:index, :show, :create, :destroy]
    resources :requests, :only => [:index, :new, :edit, :create, :update, :destroy]
  end

  match '/admin' => 'requests#index', :as => :admin_root
  match '/requests/:id/approve' => 'requests#approve', :as => :approve_request
  match '/requests/:id/validate/:code' => 'requests#validate', :as => :validate_request
  match '/requests/:id/resend_validation' => 'requests#resend_validation', :as => :resend_validation
  match '/requests/:id/validation_success' => 'requests#validation_success', :as => :validation_success

  match '/faq' => 'static_page#faq', :as => :faq

  root :to => 'static_page#index'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end

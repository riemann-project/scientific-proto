ScientificProto::Application.routes.draw do

  resources :badges

  devise_for :users, :controllers => { :registrations => "users/registrations",
                                       :confirmations => "users/confirmations",
                                       :sessions => "users/sessions" } do
    get "users/door", to: "users/registrations#door", as: "door"
    get "users/sign_up_2", to: "users/registrations#show_inbox", as: "show_inbox"
    get "users/sign_up_3", to: "users/confirmations#after_confirm", as: "after_confirm"
    get "users/mobile_sign_in", to: "users/sessions#mobile_new", as: "mobile_new_session"
    post "users/mobile_sign_in", to: "users/sessions#mobile_create", as: "mobile_create_session"
  end

  resources :users, :except => [:new, :edit, :delete] do
    get "profile_edit" => "users#edit", :on => :collection
    resources :watches, :only => [:index]
    resources :follows, :only => [:index, :create, :destroy]
    resources :images
  end
  
  resources :problem_trees, :only => [:index, :create]

  resources :problems do
    match "tag/:tag_name" => "problems#tag", :as => "tag", :on => :collection
    resources :watches, :only => [:create, :destroy]
    # resources :problem_images, :except => [:index, :show]
    resources :references, :only => [:new, :create, :edit, :destroy] do
      resources :usefuls, :only => [:create, :destroy]
    end
    resources :answers, :except => [:index] do
      resources :discussions, :except => [:index] do
        get "reply", :on => :member
        post "reply", :on => :member, :action => "create_reply"
        resources :interests, :only => [:create, :destroy]
      end
      post "good", :controller => "votes", :action => "vote_good"
      post "bad", :controller => "votes", :action => "vote_bad"
      delete "delete", :controller => "votes", :action => "destroy"
    end
  end
  
  resources :logs, :only => [:index]
  
  root :to => "logs#index"

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

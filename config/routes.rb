Graduation::Application.routes.draw do
  
  



  get "teste/teste_1"

  scope 'pgc/' do
    
  resources :board_members do
  get :confirma, :on => :member
  get :selectmember, :on => :member
  end
  resources :members do
  get :manage,   :on => :member
  get :aviso
  get :confirma, :on => :member
  get :salvar, :on => :member
  get :verifica, :on => :member
  end

  resources :duedates

  resources :board_documents do
    get :resumo, :on => :member
    get :atamanual, :on => :member
    put :atadigital
    get :enviaata, :on => :member
  end

  resources :evaluations

  resources :projects do
    post :createbanca
    get :relatorio , :on => :collection
  end

  resources :notifications

  devise_for :users, :controllers => { :registrations => "registrations" }
  


 
  match '/atamanual' , :controller => 'projects', :action => 'atamanual'
  match '/confirm' , :controller => 'login', :action => 'confirm'
  match '/aceitar' , :controller => 'projects', :action => 'accept'
  match '/avaliar' , :controller => 'projects', :action => 'evaluate'
  match '/banca' , :controller => 'projects', :action => 'banca'
   match '/novabanca' , :controller => 'projects', :action => 'editbanca'
  match '/gerarata' , :controller => 'projects', :action => 'gerarata'
  match '/send' , :controller => 'projects', :action => 'sendfile'
  
  
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
   root :to => 'notifications#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
   match ':controller(/:action(/:id))(.:format)'
   
   end
end

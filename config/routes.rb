Rails.application.routes.draw do
  resources :user_stories
  post '/projects/update_user_story', tp: "projects#update_user_story"
  get '/projects/:id/add_user_story' ,to: "projects#add_user_story"
  get '/user_stories/:id/add_task' ,to: "user_stories#add_task"
  get '/user_stories/:id/add_file' ,to: "user_stories#add_file"
  get '/user_stories/:id/get_file/:file_id' ,to: "user_stories#get_file"
  post '/user_stories/:id/save_task' ,to: "user_stories#save_task"
  post '/user_stories/:id/save_file' ,to: "user_stories#save_file"
  post '/user_stories/:id/add_comment' ,to: "user_stories#add_comment", as: :add_user_stoires_comments
  post '/projects/add_user' ,to: "projects#add_user"
  post '/projects/:id/add_comment' ,to: "projects#add_comment", as: :add_project_comments
  post '/projects/add_file', to: "projects#add_file"
  get '/users/test' ,to: "users#test"
  resources :projects
  get '/users/profile' ,to: "users#profile"
  get '/users', to: "users#index"
  root to: 'home#index'
  devise_for :users
  
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

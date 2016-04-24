Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'static_pages#home'

  get 'contact' => 'static_pages#contact'

  get 'about' => 'static_pages#about'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  get    'patients/login' => 'patient_session#new',                   as: :patient_login
  post   'patients/:id/create_inr' => 'inr_records#create',           as: :create_inr
  delete 'patients/:id/delete_inr/:inr_id' => 'inr_records#destroy',  as: :delete_inr


  get     'doctors/login'           => 'doctor_session#new',     as: :doctor_login
  post    'doctors/:id/add_patient' => 'doctors#add_patient',    as: :add_patient
  delete  'doctors/:id/delete_patient/:patient_id' => 'doctors#delete_patient', as: :remove_patient
  get     'doctors/:id/monitor_patient/:patient_id'             =>  'doctors#monitor_patient',      as: :monitor_patient
  get     'doctors/:id/initialize_patient/:patient_id'          =>  'patients#init',          as: :init_patient
  patch   'doctors/:id/initialize_patient/:patient_id'          =>  'patients#set_init',            as: :set_init_patient
  get     'doctors/:id/edit_prescriptions/:patient_id'          =>  'prescription_calendar#edit',   as: :edit_prescription_calendar
  patch   'doctors/:id/update_prescription/:prescription_id'    =>  'drug_prescriptions#update',    as: :update_prescription
  post    'doctors/:id/add_prescription/:patient_id'            =>  'drug_prescriptions#create',    as: :create_prescription
  delete  'doctors/:id/delete_prescription/:prescription_id'    =>  'drug_prescriptions#destroy',   as: :delete_prescription

  post   'login'         => 'sessions#create',      as: :login
  delete 'logout'         => 'sessions#destroy',    as: :logout
  #   resources :products
  resources :patients
  resources :doctors

  
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

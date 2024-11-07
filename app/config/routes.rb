Rails.application.routes.draw do
  get "report_issues/new"
  get "report_issues/create"
  get "requests/new"
  post "requests/create"
  get "subject_requests/new"
  post "subject_requests/create"
  get 'community', to: 'community#index'
  root 'notes#index'

  devise_for :users
  resources :students
  resources :users
  resources :subjects
  resources :notes
  resources :institutions

  resources :requests, only: [:new, :create]
  resources :report_issues, only: [:new, :create]

  resources :schools do
    get 'departments', to: 'schools#departments'
  end

  resources :departments do
    collection do
      get 'for_school', to: 'departments#departments_for_school'
    end
  end

  namespace :admin do
    get "dashboard", to: "dashboard#index"  # Admin dashboard landing page
  
    resources :subjects, only: [:index]  # View subjects in the admin namespace
  
    resources :requests, only: [:index] do
      member do
        post :approve # Approve the request
        post :reject  # Reject the request
      end
    end

    resources :reports, only: [:index] do
      member do
        patch :resolve
        delete :delete_note, action: :delete_note # Custom delete note action
        delete :delete_report, action: :destroy # Standard destroy action for reports
      end
    end
  
    root to: 'dashboard#index'  # Admin dashboard landing page
  end

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # PWA routes
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest"
end

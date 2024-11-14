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
  resources :reviews
  resources :subjects do
    resources :reviews, only: [:new, :create]  # Nested reviews routes under subjects
  end
  resources :notes
  resources :institutions

  resources :requests, only: [:new, :create]
  
  # Use report_issues for reporting
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
    get "dashboard", to: "dashboard#index"

    resources :subjects, only: [:index]

    resources :requests, only: [:index] do
      member do
        post :approve
        post :reject
      end
    end

    resources :reports, only: [:index, :destroy] do
      member do
        post :resolve
        delete :delete_note, action: :delete_note
        delete :delete_review
        delete :delete_report, action: :destroy
      end
    end

    root to: 'dashboard#index'
  end

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # PWA routes
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest"
end

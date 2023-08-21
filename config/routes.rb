Rails.application.routes.draw do
  devise_for :admins, path: "internal-panel",
                      skip: [:registrations],
                      controllers: {
                        sessions: "admin/sessions"
                      }

  authenticate :admin do
    mount Avo::Engine, at: Avo.configuration.root_path
    namespace :admin do
      resources :specialist_requests do
        member do
          post :approve
          post :reject
        end
      end
    end
  end

  devise_for :users, controllers: {
    sessions: "auth/sessions",
    registrations: "auth/registrations",
    confirmations: "auth/confirmations",
    passwords: "auth/passwords",
    omniauth_callbacks: "auth/omniauth_callbacks"
  }

  devise_scope :user do
    get "/users/sign_in/otp" => "auth/otp#new"
    post "/users/sign_in/otp" => "auth/otp#create"
    get "/users/sign_in/recovery_code" => "auth/recovery_codes#new"
    post "/users/sign_in/recovery_code" => "auth/recovery_codes#create"
  end

  authenticated :user do
    root to: "dashboard#index", as: :authenticated_root
  end

  root to: "pages#home"

  get "/setup_account" => "setup_account#new"
  post "/setup_account" => "setup_account#create"

  resources :my_health, only: [:index]

  resources :notes do
    member do
      patch :pin
      patch :unpin
      post :add_tag
      delete :remove_tag
    end
  end
  resources :note_tags, except: %i[index show]

  resources :measurements, only: %i[index show edit update destroy] do
    collection do
      get "new/:measurement_type", to: "measurements#new", as: :new
      post "create/:measurement_type", to: "measurements#create", as: :create
      get "show_by_day/:day", to: "measurements#show_by_day", as: :show_by_day
    end
  end

  resources :articles

  resources :diseases do
    resources :disease_symptoms, as: :symptoms do
      resources :disease_symptom_updates, as: :updates, except: %i[edit update]
    end
    resources :disease_risk_factors, as: :risk_factors
    resources :disease_treatments, as: :treatments, only: %i[index]
    resources :disease_photos, as: :photos, only: %i[index new create destroy]
    resources :disease_statuses, as: :statuses, path: :statuses do
      resources :disease_status_comments, as: :comments
      resources :disease_status_reactions, as: :reactions, only: %i[index] do
        collection do
          post :like
          delete :unlike
        end
      end
    end
  end

  resources :treatments do
    resources :treatment_updates
    resources :treatment_diseases, only: %i[index new create destroy]
  end

  resources :accounts, only: %i[index show] do
    resources :friends, only: %i[index destroy]
    resources :posts
  end

  resources :friend_requests

  resources :groups, only: %i[index] do
    member do
      post :join_group, as: :join
      delete :leave_group, as: :leave
    end

    scope module: :groups do
      resources :disease_symptoms
      resources :disease_statuses
      resources :disease_photos
      resources :treatments
      resources :disease_risk_factors
      resources :posts do
        resources :post_comments, as: :comments, only: %i[index create]
        resources :post_reactions, as: :reactions, only: %i[index] do
          collection do
            post :like
            delete :unlike
          end
        end
      end
    end
  end

  resources :specialists, only: %i[index]
  resources :specialist_requests

  namespace :settings do
    get "/settings", to: redirect("/settings/account")

    resource :account, only: %i[show update], controller: :account do
      delete :delete_profile_picture
    end

    resource :security, only: %i[show], controller: :security

    namespace :two_factor_authentication do
      resource :otp, only: %i[create destroy], controller: :otp
      resource :confirmations, only: %i[new create]
      resource :recovery_codes, only: %i[show create], controller: :recovery_codes
    end
  end
end

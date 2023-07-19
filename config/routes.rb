Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "auth/sessions",
    registrations: "auth/registrations",
    confirmations: "auth/confirmations",
    passwords: "auth/passwords",
    omniauth_callbacks: "auth/omniauth_callbacks"
  }

  devise_scope :user do
    get "/users/sign_in/otp" => "auth/otps#new"
    post "/users/sign_in/otp" => "auth/otps#create"
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
  resources :diseases do
    resources :disease_symptoms do
      resources :disease_symptom_updates, only: %i[create destroy]
    end
  end
end

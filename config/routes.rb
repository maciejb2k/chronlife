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

  scope module: "user" do
    get "/setup_account" => "setup_account#new"
    post "/setup_account" => "setup_account#create"

    authenticated :user do
      root to: "dashboard#index", as: :authenticated_root
    end
  end

  root to: "pages#home"
end

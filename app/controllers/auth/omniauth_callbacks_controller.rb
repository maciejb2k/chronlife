class Auth::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :verify_authenticity_token

  Devise.omniauth_configs.each_key do |provider|
    define_method provider do
      handle_omniauth_callback(provider)
    end
  end

  private

  def handle_omniauth_callback(provider)
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth!(request.env["omniauth.auth"])

    if @user.persisted?
      if @user.otp_required_for_login?
        sign_out(@user)
        session[:otp_user_id] = @user.id
        redirect_to users_sign_in_otp_path
      else
        sign_in_and_redirect @user, event: :authentication
      end
    else
      session["devise.#{provider}_data"] = request.env["omniauth.auth"].except(:extra)
      redirect_to new_user_registration_url
    end
  end
end

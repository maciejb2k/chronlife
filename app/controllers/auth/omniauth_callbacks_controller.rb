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
      sign_in_and_redirect @user, event: :authentication
      if is_navigational_format?
        set_flash_message(:notice, :success, kind: provider.to_s.capitalize)
      end
    else
      session["devise.#{provider}_data"] = request.env["omniauth.auth"].except(:extra)
      redirect_to new_user_registration_url
    end
  end
end

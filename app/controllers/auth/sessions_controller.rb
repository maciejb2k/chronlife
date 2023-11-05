class Auth::SessionsController < Devise::SessionsController
  before_action :configure_permitted_parameters

  def create
    self.resource = warden.authenticate!(:database_authenticatable, auth_options)

    if resource.otp_required_for_login?
      sign_out(resource)
      session[:otp_user_id] = resource.id

      redirect_to users_sign_in_otp_path
    else
      set_flash_message!(:notice, :signed_in)
      sign_in(resource_name, resource)
      respond_with resource, location: after_sign_in_path_for(resource)
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:otp_attempt])
  end
end

class Auth::OtpsController < DeviseController
  include OtpSessionExpirable

  prepend_before_action :require_no_authentication, only: %i[new create]
  before_action :expire_otp_session!

  def new
    return if User.exists?(session[:otp_user_id])

    session[:otp_user_id] = nil
    redirect_to new_user_session_path
  end

  def create
    resource = warden.authenticate!(
      :otp_attempt_authenticatable,
      {
        scope: resource_name,
        recall: "#{controller_path}#new"
      }
    )

    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    respond_with resource, location: after_sign_in_path_for(resource)
  end
end

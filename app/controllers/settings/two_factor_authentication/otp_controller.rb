class Settings::TwoFactorAuthentication::OtpController < BaseController
  before_action :verify_otp_not_enabled, only: %i[create]
  before_action :verify_otp_enabled, only: %i[destroy]

  def create
    session[:new_otp_secret] = User.generate_otp_secret(32)

    redirect_to new_settings_two_factor_authentication_confirmations_path
  end

  def destroy
    current_user.disable_two_factor!

    redirect_to settings_security_path, notice: t(".success")
  end

  private

  def verify_otp_not_enabled
    redirect_to settings_security_path if current_user.otp_enabled?
  end

  def verify_otp_enabled
    redirect_to settings_security_path unless current_user.otp_enabled?
  end
end

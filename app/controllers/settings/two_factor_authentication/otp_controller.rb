class Settings::TwoFactorAuthentication::OtpController < BaseController
  before_action :verify_otp_not_enabled, only: %i[create]

  def create
    session[:new_otp_secret] = User.generate_otp_secret(32)
    redirect_to new_settings_two_factor_authentication_confirmations_path
  end

  def destroy
    current_user.otp_required_for_login = false
    current_user.otp_backup_codes&.clear
    current_user.save!
    redirect_to two_factor_authentication_path
  end

  private

  def verify_otp_not_enabled
    redirect_to settings_security_path if current_user.otp_enabled?
  end
end

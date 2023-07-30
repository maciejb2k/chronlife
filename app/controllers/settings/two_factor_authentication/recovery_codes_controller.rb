class Settings::TwoFactorAuthentication::RecoveryCodesController < BaseController
  before_action :verify_otp_enabled, only: %i[show]

  def show
    @recovery_codes = current_user.generate_otp_backup_codes!
    current_user.save!
  end

  private

  def verify_otp_enabled
    redirect_to settings_security_path unless current_user.otp_enabled?
  end
end

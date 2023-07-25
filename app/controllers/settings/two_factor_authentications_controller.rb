class Settings::TwoFactorAuthenticationsController < BaseController
  def create
    current_user.otp_secret = User.generate_otp_secret
    current_user.save!

    @qrcode = current_user.otp_qrcode
    render "settings/two_factor_authentication/confirmations/new"
  end
end

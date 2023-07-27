class Settings::TwoFactorAuthentication::ConfirmationsController < BaseController
  layout "dashboard"

  before_action :set_breadcrumbs
  before_action :ensure_otp_secret

  def new
    prepare_two_factor_form
  end

  def create
    if current_user.validate_and_consume_otp!(confirmation_params[:otp_code],
                                              otp_secret: session[:new_otp_secret])
      flash[:notice] = "Poprawnie włączono dwuskładnikowe uwierzytelnianie."

      current_user.otp_required_for_login = true
      current_user.otp_secret = session[:new_otp_secret]
      @recovery_codes = current_user.generate_otp_backup_codes!
      current_user.save!

      session.delete(:new_otp_secret)

      redirect_to settings_security_path
    else
      flash[:error] = "Nieprawidłowy kod weryfikacyjny. Spróbuj ponownie."
      prepare_two_factor_form
      render :new, status: :unprocessable_entity
    end
  end

  private

  def confirmation_params
    params.require(:two_factor_setup).permit(:otp_code)
  end

  def ensure_otp_secret
    redirect_to settings_security_path if session[:new_otp_secret].blank?
  end

  def prepare_two_factor_form
    @new_otp_secret = session[:new_otp_secret]
    @provision_url = current_user.otp_provisioning_uri(
      current_user.email,
      otp_secret: @new_otp_secret,
      issuer: "Przewlekli.pl"
    )

    @qrcode = RQRCode::QRCode.new(@provision_url)
  end

  def set_breadcrumbs
    add_breadcrumb("home", authenticated_root_path)
    add_breadcrumb("ustawienia", settings_settings_path)
    add_breadcrumb("zabezpieczenia", settings_security_path)
    add_breadcrumb("skonfiguruj 2FA")
  end
end

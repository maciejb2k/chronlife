class Settings::TwoFactorAuthentication::ConfirmationsController < BaseController
  before_action :set_breadcrumbs
  before_action :ensure_otp_secret

  def new
    prepare_two_factor_form
  end

  def create
    if current_user.validate_and_consume_otp!(confirmation_params[:otp_attempt],
                                              otp_secret: session[:new_otp_secret])
      flash[:notice] = t(".success")
      current_user.enable_two_factor!(session[:new_otp_secret])
      @recovery_codes = current_user.generate_otp_backup_codes!
      session.delete(:new_otp_secret)

      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to settings_security_path }
      end
    else
      prepare_two_factor_form
      flash.now[:error] = t(".error")

      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.update(:flash, partial: "shared/dash_flash")
        end
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def confirmation_params
    params.require(:two_factor_setup).permit(:otp_attempt)
  end

  def ensure_otp_secret
    redirect_to settings_security_path if session[:new_otp_secret].blank?
  end

  def prepare_two_factor_form
    @new_otp_secret = session[:new_otp_secret]
    @provision_url = current_user.two_factor_provisioning_uri(@new_otp_secret)
    @qrcode = current_user.two_factor_otp_qrcode(@provision_url)
  end

  def set_breadcrumbs
    add_breadcrumb t("breadcrumbs.home"), authenticated_root_path
    add_breadcrumb t("settings.breadcrumbs.index"), settings_settings_path
    add_breadcrumb t("settings.security.breadcrumbs.show"), settings_security_path

    case action_name.to_sym
    when :new
      add_breadcrumb t(".breadcrumbs.new")
    end
  end
end

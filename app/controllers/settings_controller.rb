class SettingsController < BaseController
  layout "dashboard"

  before_action :set_breadcrumbs
  before_action :set_breadcrumbs_account, only: %i[account]
  before_action :set_breadcrumbs_privacy, only: %i[privacy]
  before_action :set_breadcrumbs_notifications, only: %i[notifications]

  def account
    @user = current_user
    @account = @user.account
  end

  def update_account
    @user = current_user
    @account = @user.account

    if @account.update(account_params)
      redirect_to settings_account_path, notice: "Zaktualizowano ustawienia konta"
    else
      render :account, status: :unprocessable_entity
    end
  end

  def privacy; end

  def notifications; end

  private

  def account_params
    params.require(:account).permit(:first_name, :last_name, :email, :birthday, :phone_number,
                                    :country, :city, :education)
  end

  def set_breadcrumbs
    add_breadcrumb("home", authenticated_root_path)
    add_breadcrumb("ustawienia", settings_path)
  end

  def set_breadcrumbs_account
    add_breadcrumb("konto", settings_account_path)
  end

  def set_breadcrumbs_privacy
    add_breadcrumb("prywatność", settings_privacy_path)
  end

  def set_breadcrumbs_notifications
    add_breadcrumb("powiadomienia", settings_notifications_path)
  end
end

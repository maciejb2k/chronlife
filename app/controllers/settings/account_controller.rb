class Settings::AccountController < BaseController
  layout "dashboard"

  before_action :set_breadcrumbs

  before_action :set_account
  before_action :set_education_options, only: %i[show update]

  def show; end

  def update
    if @account.update(account_params)
      redirect_to settings_account_path, notice: "Zaktualizowano ustawienia konta"
    else
      render :account, status: :unprocessable_entity
    end
  end

  def delete_profile_picture
    @account.image = nil
    @account.save!

    redirect_to settings_account_path, notice: "Zaktualizowano zdjęcie profilowe"
  end

  private

  def account_params
    params.require(:account).permit(:first_name, :last_name, :email, :birthday, :phone_number,
                                    :country, :city, :education, :image)
  end

  def set_account
    @account = current_account
  end

  def set_breadcrumbs
    add_breadcrumb("home", authenticated_root_path)
    add_breadcrumb("ustawienia", settings_settings_path)
    add_breadcrumb("konto", settings_account_path)
  end

  def set_education_options
    @education_options = Account::EDUCATION_OPTIONS.map do |key|
      [I18n.t("activerecord.attributes.account.education.#{key}"), key]
    end
  end
end

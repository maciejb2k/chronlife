class Settings::SecurityController < BaseController
  before_action :set_breadcrumbs

  def show
    @resource = current_user
  end

  private

  def set_breadcrumbs
    add_breadcrumb t("breadcrumbs.home"), authenticated_root_path
    add_breadcrumb t("settings.breadcrumbs.index"), settings_settings_path
    add_breadcrumb t(".breadcrumbs.show"), settings_security_path
  end
end

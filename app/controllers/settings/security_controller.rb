class Settings::SecurityController < BaseController
  layout "dashboard"

  before_action :set_breadcrumbs

  def show
    @resource = current_user
  end

  private

  def set_breadcrumbs
    add_breadcrumb("home", authenticated_root_path)
    add_breadcrumb("ustawienia", settings_settings_path)
    add_breadcrumb("zabezpieczenia", settings_security_path)
  end
end

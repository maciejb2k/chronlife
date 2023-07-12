class DashboardController < BaseController
  layout "dashboard"

  before_action :set_breadcrumbs

  def set_breadcrumbs
    add_breadcrumb("Home", authenticated_root_path)
  end
end

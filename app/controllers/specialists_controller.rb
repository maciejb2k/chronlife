class SpecialistsController < BaseController
  before_action :set_breadcrumbs

  def index
    @pagy, @specialists = pagy(
      User.joins(:roles).where(roles: { name: "specialist" })
    )
  end

  private

  def set_breadcrumbs
    add_breadcrumb t("breadcrumbs.home"), authenticated_root_path
    add_breadcrumb t(".breadcrumbs.index"), specialists_path
  end
end

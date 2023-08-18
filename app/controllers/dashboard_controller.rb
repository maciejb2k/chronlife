class DashboardController < BaseController
  layout "dashboard"

  before_action :set_breadcrumbs

  def set_breadcrumbs
    add_breadcrumb("Home", authenticated_root_path)
  end

  def index
    @pagy, @posts = pagy(
      DiseaseStatus
      .joins(:disease)
      .includes(:disease, :comments, :reactions, disease: %i[predefined_disease account])
      .order(created_at: :desc),
      items: 10
    )
  end
end

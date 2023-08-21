class DashboardController < BaseController
  before_action :set_breadcrumbs

  def index
    @pagy, @posts = pagy(
      DiseaseStatus
      .joins(:disease)
      .includes(:disease, :comments, :reactions, disease: %i[predefined_disease account])
      .order(created_at: :desc),
      items: 10
    )
  end

  private

  def set_breadcrumbs
    add_breadcrumb t("breadcrumbs.home"), authenticated_root_path
  end
end

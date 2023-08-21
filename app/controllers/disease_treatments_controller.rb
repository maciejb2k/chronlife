class DiseaseTreatmentsController < BaseController
  include DashboardLayout
  include DiseaseSettable

  before_action :set_breadcrumbs

  def index
    @pagy, @treatments = pagy(
      @disease.treatments,
      items: 10
    )
  end

  private

  def set_breadcrumbs
    add_breadcrumb t("diseases.breadcrumbs.home"), authenticated_root_path
    add_breadcrumb t("diseases.breadcrumbs.index"), diseases_path
    add_breadcrumb @disease.predefined_disease.name, @disease
    add_breadcrumb t(".breadcrumbs.index"), disease_treatments_path
  end
end

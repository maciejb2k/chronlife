class DiseaseTreatmentsController < BaseController
  include DashboardLayout
  include DiseaseSettable

  before_action :set_breadcrumbs

  def index
    @pagy, @treatments = pagy(@disease.treatments, items: 10)
  end

  private

  def set_breadcrumbs
    add_breadcrumb("home", authenticated_root_path)
    add_breadcrumb("choroby", diseases_path)
    add_breadcrumb(@disease.predefined_disease.name, @disease)
    add_breadcrumb("terapie", disease_disease_treatments_path)
  end
end

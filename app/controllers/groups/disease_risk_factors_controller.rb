class Groups::DiseaseRiskFactorsController < Groups::BaseController
  before_action :set_breadcrumbs

  def index
    @pagy, @risk_factors = pagy(
      DiseaseRiskFactor
      .joins(disease: :account)
      .includes(disease: :account)
      .where(disease: { account: @group.accounts, predefined_disease: @group.predefined_disease })
      .order(name: :asc)
    )
  end

  private

  def set_breadcrumbs
    add_breadcrumb t("groups.disease_risk_factors_controller.breadcrumbs.index"),
                   group_disease_risk_factors_path(@group)
  end
end

class Groups::DiseaseRiskFactorsController < Groups::BaseController
  def index
    @pagy, @risk_factors = pagy(
      DiseaseRiskFactor
      .joins(disease: :account)
      .includes(disease: :account)
      .where(disease: { account: @group.accounts, predefined_disease: @group.predefined_disease })
      .order(name: :asc)
    )
  end
end

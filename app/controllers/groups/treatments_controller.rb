class Groups::TreatmentsController < Groups::BaseController
  def index
    @pagy, @treatments = pagy(
      Treatment
      .joins(:diseases)
      .includes(:diseases)
      .where(account: @group.accounts, diseases: { predefined_disease: @group.predefined_disease })
    )
  end
end

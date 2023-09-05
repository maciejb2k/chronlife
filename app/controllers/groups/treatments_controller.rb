class Groups::TreatmentsController < Groups::BaseController
  before_action :set_breadcrumbs

  def index
    @pagy, @treatments = pagy(
      Treatment
      .joins(:diseases)
      .includes(:diseases)
      .where(account: @group.accounts, diseases: { predefined_disease: @group.predefined_disease })
    )
  end

  private

  def set_breadcrumbs
    add_breadcrumb t("groups.treatments_controller.breadcrumbs.index"),
                   group_treatments_path(@group)
  end
end

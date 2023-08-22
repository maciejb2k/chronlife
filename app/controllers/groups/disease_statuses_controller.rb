class Groups::DiseaseStatusesController < Groups::BaseController
  before_action :set_breadcrumbs

  def index
    @pagy, @posts = pagy(
      DiseaseStatus
      .joins(disease: %i[account predefined_disease])
      .includes(:comments, :reactions, disease: %i[account predefined_disease])
      .where(disease: { account: @group.accounts, predefined_disease: @group.predefined_disease })
      .order(updated_at: :desc),
      items: 10
    )

    @liked_statuses = Reaction.where(
      account: current_account,
      reaction_type: "like",
      reactable_type: "DiseaseStatus"
    ).pluck(:reactable_id)
  end

  private

  def set_breadcrumbs
    add_breadcrumb t("groups.disease_statuses_controller.breadcrumbs.index"),
                   group_disease_statuses_path(@group)
  end
end

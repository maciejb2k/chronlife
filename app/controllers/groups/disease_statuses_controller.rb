class Groups::DiseaseStatusesController < Groups::BaseController
  def index
    @pagy, @posts = pagy(
      DiseaseStatus
      .joins(disease: %i[account predefined_disease])
      .includes(:comments, :reactions, disease: %i[account predefined_disease])
      .where(disease: { account: @group.accounts, predefined_disease: @group.predefined_disease }),
      items: 10
    )

    @liked_statuses = Reaction.where(
      account: current_account,
      reaction_type: "like",
      reactable_type: "DiseaseStatus"
    ).pluck(:reactable_id)
  end
end

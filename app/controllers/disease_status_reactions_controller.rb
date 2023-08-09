class DiseaseStatusReactionsController < ReactionsController
  before_action :set_disease
  before_action :set_reactable

  private

  def set_disease
    @disease = current_account.diseases.find(params[:disease_id])
  end

  def set_reactable
    @reactable = @disease.statuses.find(params[:disease_status_id])
  end
end

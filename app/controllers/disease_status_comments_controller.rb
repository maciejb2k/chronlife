class DiseaseStatusCommentsController < CommentsController
  before_action :set_disease
  before_action :set_commentable

  private

  def set_disease
    @disease = current_account.diseases.find(params[:disease_id])
  end

  def set_commentable
    @disease_status = @disease.statuses.find(params[:id])
  end
end

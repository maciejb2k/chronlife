class DiseaseStatusCommentsController < CommentsController
  before_action :set_commentable

  def show
    @comments = @commentable.comments
  end

  private

  def set_commentable
    @commentable = DiseaseStatus.find(params[:disease_status_id])
  end
end

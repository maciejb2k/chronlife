class DiseaseStatusCommentsController < CommentsController
  before_action :set_commentable

  def create
    @comment = @commentable.comments.build comment_params
    @comment.account = current_account
    @comment.save!

    @disease_status = @commentable
    @disease = @commentable.disease

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @commentable, notice: "Comment created" }
    end
  end

  private

  def set_commentable
    @commentable = DiseaseStatus.find(params[:disease_status_id])
  end
end

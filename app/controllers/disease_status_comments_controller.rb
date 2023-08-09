class DiseaseStatusCommentsController < CommentsController
  before_action :set_commentable

  def index
    @pagy, @comments = pagy_countless(
      @disease_status
      .comments
      .joins(:account)
      .includes(:account)
      .order(created_at: :desc),
      items: 3
    )

    respond_to do |format|
      format.turbo_stream
      format.html
    end
  end

  def create
    @comment = @disease_status.comments.build comment_params
    @comment.account = current_account

    if @comment.save!
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @disease_status, notice: "Poprawnie dodano nowy komentarz." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_commentable
    @disease = Disease.find(params[:disease_id])
    @disease_status = DiseaseStatus.find(params[:disease_status_id])
  end
end

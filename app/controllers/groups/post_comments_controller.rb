class Groups::PostCommentsController < Groups::BaseController
  before_action :set_commentable

  def index
    @pagy, @comments = pagy_countless(
      @post
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
    @comment = @post.comments.build comment_params
    @comment.account = current_account

    if @comment.save!
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @comment, notice: "Poprawnie dodano nowy komentarz." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_commentable
    @post = GroupPost.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
